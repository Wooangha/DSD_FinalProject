import pandas as pd


def get_led_minterm(led_output: pd.DataFrame, num: int) -> tuple[set[int], set[int]]:
    """
    Extracts the minterms and don't care terms from the LED output DataFrame.

    Args:
        led_output (pd.DataFrame): DataFrame containing LED output data.

    Returns:
        tuple[set[int], set[int]]: A tuple containing two sets:
            - The first set contains the minterms.
            - The second set contains the don't care terms.
    """
    minterms = set()
    dont_cares = {i for i in range(1 << 13)}
    maxterms = set()

    str2int = lambda s: int(s, 2) if isinstance(s, str) else s

    for i in range(len(led_output)):
        row = led_output.iloc[i]
        state = row["state"]
        led = row["led"][num]
        if led == "1":
            minterms.add(str2int(state))
        elif led == "0":
            maxterms.add(str2int(state))

    dont_cares = dont_cares - minterms - maxterms
    return minterms, dont_cares

"""
import led_output as l
l.get_led_minterms_all("led.csv", "led_result.txt")
"""
def get_led_minterms_all(input_path: str, output_path: str) -> None:
    """
    Processes the LED output data from a CSV file and saves the minterms and don't care terms.

    Args:
        input_path (str): Path to the input CSV file containing LED output data.
        output_path (str): Path to save the output CSV file with minterms and don't care terms.
    """
    df = pd.read_csv(input_path, header=0, dtype=str, sep=";")
    df["state"] = df["BR"] + df["case"] + df["def"] + df["now"] + df["next"] + df["counter"]


    for i in range(10):
        outname = f"led_{i}_" + output_path
        with open(outname, "w") as f:
            minterms, dont_cares = get_led_minterm(df, i)
            f.write("13\n")
            for mm in sorted(minterms):
                f.write(f"m {mm}\n")
            for dc in sorted(dont_cares):
                f.write(f"d {dc}\n")
    for i in range(12, 17):
        outname = f"led_{i}_" + output_path
        with open(outname, "w") as f:
            minterms, dont_cares = get_led_minterm(df, i)
            f.write("13\n")
            for mm in sorted(minterms):
                f.write(f"m {mm}\n")
            for dc in sorted(dont_cares):
                f.write(f"d {dc}\n")

"""
./qm_linux led_0_led_result.txt led_0_input.txt ; ./qm_linux led_1_led_result.txt led_1_input.txt ;
./qm_linux led_2_led_result.txt led_2_input.txt ; ./qm_linux led_3_led_result.txt led_3_input.txt ;
./qm_linux led_4_led_result.txt led_4_input.txt ; ./qm_linux led_5_led_result.txt led_5_input.txt ;
./qm_linux led_6_led_result.txt led_6_input.txt ; ./qm_linux led_7_led_result.txt led_7_input.txt ;
./qm_linux led_8_led_result.txt led_8_input.txt ; ./qm_linux led_9_led_result.txt led_9_input.txt ;
./qm_linux led_12_led_result.txt led_12_input.txt ; ./qm_linux led_13_led_result.txt led_13_input.txt ;
./qm_linux led_14_led_result.txt led_14_input.txt ; ./qm_linux led_15_led_result.txt led_15_input.txt ;
./qm_linux led_16_led_result.txt led_16_input.txt

qm.exe led_0_led_result.txt led_0_input.txt & qm.exe led_1_led_result.txt led_1_input.txt &
qm.exe led_2_led_result.txt led_2_input.txt & qm.exe led_3_led_result.txt led_3_input.txt &
qm.exe led_4_led_result.txt led_4_input.txt & qm.exe led_5_led_result.txt led_5_input.txt &
qm.exe led_6_led_result.txt led_6_input.txt & qm.exe led_7_led_result.txt led_7_input.txt &
qm.exe led_8_led_result.txt led_8_input.txt & qm.exe led_9_led_result.txt led_9_input.txt &
qm.exe led_12_led_result.txt led_12_input.txt & qm.exe led_13_led_result.txt led_13_input.txt &
qm.exe led_14_led_result.txt led_14_input.txt & qm.exe led_15_led_result.txt led_15_input.txt &
qm.exe led_16_led_result.txt led_16_input.txt
"""
