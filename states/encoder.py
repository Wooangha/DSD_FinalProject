"""
import encoder
encoder.make('test.txt')
"""


def make(output_path: str, out_num: int) -> None:
    """
    Create encoder mapping
    """
    with open(output_path, "w") as f:
        f.write("7\n")
        minterms = set()
        doncareterms = {i for i in range(0, 1 << 7)}
        maxterms = set()

        def check(i: int) -> bool:
            # out3
            if out_num == 3:
                if i == 0 or i == 5 or i == 6 or i == 7:
                    return True
                else:
                    return False

            # out2
            elif out_num == 2:
                if i == 0 or i == 1 or i == 2 or i == 7:
                    return True
                else:
                    return False

            # out1
            elif out_num == 1:
                if i == 0 or i == 1 or i == 3 or i == 6:
                    return True
                else:
                    return False
            else:
                raise ValueError("Invalid out_num, must be 1, 2, or 3")

        if check(0):
            minterms.add(0)
        else:
            maxterms.add(0)

        for i in range(0, 7):
            for j in range(1 << i, 1 << (i + 1)):
                if check(i + 1):
                    minterms.add(j)
                else:
                    maxterms.add(j)

        doncareterms = doncareterms - minterms - maxterms
        for mm in minterms:
            f.write(f"m {mm}\n")
        for dm in doncareterms:
            f.write(f"d {dm}\n")
