import pandas as pd
import re

from typing import Callable

from qm.qm import qm

COLUMNS = [
    "Present",
    "Next_INPUT=X",
    "Next_INPUT=down",
    "Next_INPUT=left",
    "Next_INPUT=decision",
    "Next_INPUT=right",
    "Next_INPUT=up"
]

INPUT2REG = {
    "Next_INPUT=up": "000",
    "Next_INPUT=down": "001",
    "Next_INPUT=left": "010",
    "Next_INPUT=right": "011",
    "Next_INPUT=decision": "100",
    "Next_INPUT=reset_blue": "101",
    "Next_INPUT=reset_red": "110",
    "Next_INPUT=X": "111",
}

def swap_R_B_in_csv(input_path: str, output_path: str):
    """
    CSV 파일을 읽어 S_R과 S_B를 서로 교환한 뒤 새 CSV로 저장합니다.

    :param input_path: 원본 CSV 파일 경로 (예: 'original.csv')
    :param output_path: 결과를 저장할 CSV 파일 경로 (예: 'swapped.csv')
    """
    # CSV 읽기 (모든 데이터를 문자열로 읽고, NA 값은 비워둠)
    df = pd.read_csv(input_path, dtype=str, keep_default_na=False)

    # 각 셀에 대해 S_R <-> S_B 치환 함수
    def swap_rb(value):
        if not isinstance(value, str):
            return value
        temp = re.sub(r'S_R', 'S_TEMP', value)   # S_R → S_TEMP
        temp = re.sub(r'S_B', 'S_R', temp)       # S_B → S_R
        return re.sub(r'S_TEMP', 'S_B', temp)    # S_TEMP → S_B

    # 전체 데이터프레임에 적용
    df = df.applymap(swap_rb)

    # 결과 CSV 저장
    df.to_csv(output_path, index=False, encoding='utf-8-sig')

def x2state(acc: pd.DataFrame, row: pd.Series):
    """
    x를 같은 present state로 변경시킨다.
    """
    present = row[COLUMNS[0]]
    for i in range(1, len(COLUMNS)):
        next_input = row[COLUMNS[i]]
        if next_input == "x":
            row[COLUMNS[i]] = present
    acc.loc[len(acc)] = row

def x2state_all(input_path: str, output_path: str):
    """
    x를 같은 present state로 변경시킨다.
    """
    df = pd.read_csv(input_path, sep=",")
    acc = pd.DataFrame(columns=COLUMNS)
    for i in range(len(df)):
        row = df.iloc[i]
        x2state(acc, row)
    acc.to_csv(output_path, index=False, encoding='utf-8-sig')

def add_reset(input_path: str, output_path: str):
    """
    reset을 추가한다.
    """
    df = pd.read_csv(input_path, sep=",")
    df["Next_INPUT=reset_blue"] = ["S_R2-D2(2)"] * len(df)
    df["Next_INPUT=reset_red"] = ["S_B2-D2(2)"] * len(df)
    df.to_csv(output_path, index=False, encoding='utf-8-sig')

"""
import state as st
st.change2reg("final_state_transition.csv", "reg_transition.csv")
"""
def change2reg(input_path: str, output_path: str):
    """
    
    """
    df = pd.read_csv(input_path, sep=",")
    col = df.columns
    for c in col:
        def parser(x):
            def num2reg1(n):
                if n == 1:
                    return "01"
                elif n == 2:
                    return "10"
                elif n == 3:
                    return "11"
                else:
                    raise ValueError(f"Unexpected number: {n}")
            def num2reg2(n):
                if n == 1:
                    return "001"
                elif n == 2:
                    return "010"
                elif n == 3:
                    return "011"
                elif n == 4:
                    return "100"
                elif n == 5:
                    return "101"
                else:
                    raise ValueError(f"Unexpected number: {n}")
            ret = ''
            if x[2] == 'R':
                ret += '0'
            elif x[2] == 'B':
                ret += '1'
            else:
                raise ValueError(f"Unexpected character in state: {x[2]}")
            x = x[3:]
            if x == "Goal":
                ret += "000000000"
                return ret
            else:
                n = int(x[0])
                ret += num2reg1(n)
            x = x[2:]
            if x[0] == 'D':
                ret += '00'
                ret += num2reg1(int(x[2]))
                ret += "000"
                return ret
            elif x[0] == 'A':
                ret += num2reg1(int(x[2]))
                ret += num2reg1(int(x[4]))
                ret += num2reg2(int(x[6]))
                return ret
            else:
                raise ValueError(f"Unexpected character in state: {x[0]}")
        df[c] = df[c].apply(parser)
    df.to_csv(output_path, index=False, encoding='utf-8-sig')

"""
import state as st
st.add_dff("reg_transition.csv", "DFF.csv")
"""
def add_dff(input_path: str, output_path: str):
    """
    DFF를 추가한다.
    """
    df = pd.read_csv(input_path, sep=",", dtype=str, keep_default_na=False)
    col = df.columns
    for i in reversed(range(10)):
        for c in sorted(col):
            if c == "Present":
                continue
            f = lambda x : x[9 - i]
            df[f'D-{i}-{c}'] = df[c].apply(f)
    df.to_csv(output_path, index=False, encoding='utf-8-sig')

def get_minterms(df: pd.DataFrame, d_num: int):
    """
    minterms를 구한다. {STATE, INPUT} 순서이다. {Most Significant Bit, ... Least Significant Bit} 순서로 되어 있다.
    """
    str2int : Callable[[str], int] = lambda s: int(s, 2)
    int2str : Callable[[int], str] = lambda i: bin(i)[2:].zfill(3)
    minterms = set()
    doncares = set()
    maxterms = set()
    
    for i in range(8):
        input_num = int2str(i)
        check = f'D-{d_num}-{input_num}'
        if check not in df.columns:
            raise ValueError(f"Column {check} not found in the DataFrame.")
        for i in range(len(df)):
            row = df.iloc[i]
            if row[check] == '1':
                minterms.add(str2int(row['Present'] + input_num))
            elif row[check] == '0':
                maxterms.add(str2int(row['Present'] + input_num))
    # doncares = {i for i in range(1<<13)} # 13 bits for 3 bits of input and 10 bits of state
    # doncares = set()
    # doncares = doncares - minterms - maxterms
    print(f"minterms: {minterms}")
    print(f"doncares: {doncares}")
    # res = qm(list(minterms), list(doncares))
    return (minterms, doncares)
"""
import state as st
st.get_minterms_all("DFF.csv", "result.txt")
"""
def get_minterms_all(input_path: str, output_path: str):
    f = open(output_path, 'w')
    df = pd.read_csv(input_path, sep=",", dtype=str, keep_default_na=False)
    for i in reversed(range(0, 10)):
        with open(f"D_{i}_"+output_path, 'w') as f:
            m, d = get_minterms(df, i)
            f.write('13\n')
            for mm in m:
                f.write(f'm {mm}\n')
            for dd in d:
                f.write(f'd {dd}\n')
            # f.write(f'D{i}: {s}  \n')
    f.close()
"""
./qm_linux D_0_result.txt D_0_input.txt ; ./qm_linux D_1_result.txt D_1_input.txt ; ./qm_linux D_2_result.txt D_2_input.txt ; ./qm_linux D_3_result.txt D_3_input.txt ; ./qm_linux D_4_result.txt D_4_input.txt ; ./qm_linux D_5_result.txt D_5_input.txt ; ./qm_linux D_6_result.txt D_6_input.txt ; ./qm_linux D_7_result.txt D_7_input.txt ; ./qm_linux D_8_result.txt D_8_input.txt ; ./qm_linux D_9_result.txt D_9_input.txt
"""


if __name__ == "__main__":
    df = pd.read_csv("merged_state_transition.csv", sep=",")
    acc = pd.DataFrame(
        columns= COLUMNS,
    )
    for i in range(len(df)):
        row = df.iloc[i]
        x2state(acc, row)
    acc.to_csv("acc_state_transition.csv", index=False, encoding='utf-8-sig')