import pandas as pd
import re

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