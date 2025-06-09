#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <sstream>
#include <algorithm>
#include <map>
#include <set>
#include <cmath>

// Implicant를 표현하는 구조체
struct Implicant {
    int value; // 이진 값
    int mask;  // 대시(-)의 위치를 나타내는 마스크
    std::vector<int> minterms; // 이 Implicant가 포함하는 원래 minterm들
    bool is_prime = true; // Prime Implicant인지 여부

    bool operator==(const Implicant& other) const {
        return value == other.value && mask == other.mask;
    }
};

// Implicant를 정렬하고 중복을 제거하기 위한 비교 함수
struct ImplicantCompare {
    bool operator()(const Implicant& a, const Implicant& b) const {
        if (a.value != b.value) {
            return a.value < b.value;
        }
        return a.mask < b.mask;
    }
};

// 1의 개수를 세는 함수
int countSetBits(int n) {
    int count = 0;
    while (n > 0) {
        n &= (n - 1);
        count++;
    }
    return count;
}

// Implicant를 문자열 형태로 변환하는 함수
std::string implicantToString(const Implicant& imp, int num_bits) {
    if (imp.mask == (1 << num_bits) - 1) return "1"; // 항상 참인 경우 (모든 비트가 don't care)
    std::stringstream ss;
    ss << "(";
    bool first_term = true;
    for (int i = 0; i < num_bits; ++i) {
        int bit_pos = num_bits - 1 - i;
        if (!((imp.mask >> bit_pos) & 1)) { // 해당 비트가 대시가 아니면
            if (!first_term) {
                ss << " & ";
            }
            char var_name = 'A' + i;
            if (!((imp.value >> bit_pos) & 1)) { // 비트가 0이면
                ss << "~" << var_name;
            } else { // 비트가 1이면
                ss << var_name;
            }
            first_term = false;
        }
    }
    ss << ")";
    return ss.str();
}

int main(int argc, char* argv[]) {
	// qm.exe D_0_result.txt D_0_input.txt & qm.exe D_1_result.txt D_1_input.txt & qm.exe D_2_result.txt D_2_input.txt & qm.exe D_3_result.txt D_3_input.txt
	if (argc != 3)
		return 1;
	std::string input_file = argv[1];
	std::string output_file = argv[2];
	std::cout << "processing: " << input_file << '\n';
    std::ifstream inputFile(input_file);
    if (!inputFile.is_open()) {
        std::cerr << "Error: input.txt 파일을 열 수 없습니다." << std::endl;
        return 1;
    }

    int num_bits;
    inputFile >> num_bits;

    std::vector<int> minterms;
    std::vector<int> dont_cares;
    char type;
    int term;
    while (inputFile >> type >> term) {
        if (type == 'm') {
            minterms.push_back(term);
        } else if (type == 'd') {
            dont_cares.push_back(term);
        }
    }
    inputFile.close();

    // 1단계: Prime Implicant 찾기
    std::vector<Implicant> all_implicants;
    std::vector<int> initial_terms = minterms;
    initial_terms.insert(initial_terms.end(), dont_cares.begin(), dont_cares.end());
    std::sort(initial_terms.begin(), initial_terms.end());
    initial_terms.erase(std::unique(initial_terms.begin(), initial_terms.end()), initial_terms.end());

    for (int mt : initial_terms) {
        all_implicants.push_back({mt, 0, {mt}, true});
    }

    std::vector<Implicant> prime_implicants;
    std::vector<Implicant> current_implicants = all_implicants;

	int cnt = 0;
    while (true) {
		std::cout << "now: " << cnt++ << '\n';
        bool changed = false;
        if (current_implicants.empty()) break;

        std::map<int, std::vector<Implicant*>> groups;
        for (auto& imp : current_implicants) {
            groups[countSetBits(imp.value)].push_back(&imp);
        }

        std::vector<Implicant> next_implicants;
        std::set<Implicant, ImplicantCompare> next_implicants_set;

        for (int i = 0; i < num_bits; ++i) {
            if (groups.count(i) && groups.count(i + 1)) {
                for (auto imp1 : groups[i]) {
                    for (auto imp2 : groups[i + 1]) {
                        if (imp1->mask == imp2->mask) {
                            int diff = imp2->value - imp1->value;
                            if (diff > 0 && (diff & (diff - 1)) == 0) { // 차이가 2의 거듭제곱인지 확인
                                changed = true;
                                imp1->is_prime = false;
                                imp2->is_prime = false;
                                std::vector<int> combined_minterms = imp1->minterms;
                                combined_minterms.insert(combined_minterms.end(), imp2->minterms.begin(), imp2->minterms.end());
                                std::sort(combined_minterms.begin(), combined_minterms.end());
                                combined_minterms.erase(std::unique(combined_minterms.begin(), combined_minterms.end()), combined_minterms.end());

                                next_implicants_set.insert({imp1->value, imp1->mask | diff, combined_minterms, true});
                            }
                        }
                    }
                }
            }
        }
        
        for (auto& imp : current_implicants) {
            if (imp.is_prime) {
                prime_implicants.push_back(imp);
            }
        }
        
        if (!changed) break;

        current_implicants.assign(next_implicants_set.begin(), next_implicants_set.end());
    }

    std::sort(prime_implicants.begin(), prime_implicants.end(), ImplicantCompare());
    prime_implicants.erase(std::unique(prime_implicants.begin(), prime_implicants.end()), prime_implicants.end());

    // 2단계: Prime Implicant Chart 만들고 최소 해 구하기
    std::map<int, std::vector<Implicant*>> chart;
    std::set<int> uncovered_minterms(minterms.begin(), minterms.end());

    for (auto& pi : prime_implicants) {
        for (int mt : pi.minterms) {
            if (uncovered_minterms.count(mt)) {
                chart[mt].push_back(&pi);
            }
        }
    }
    
    std::vector<Implicant> solution;
    
    // Essential Prime Implicants 선택
    for (auto const& [mt, pis] : chart) {
        if (pis.size() == 1) {
            Implicant* epi = pis[0];
            bool already_in_solution = false;
            for(const auto& sol_imp : solution) {
                if(sol_imp == *epi) {
                    already_in_solution = true;
                    break;
                }
            }
            if (!already_in_solution) {
                solution.push_back(*epi);
            }
        }
    }

    for (const auto& sol_imp : solution) {
        for (int mt : sol_imp.minterms) {
            uncovered_minterms.erase(mt);
        }
    }

    // 남은 minterm들 처리 (Greedy-Heuristic 방식)
    while (!uncovered_minterms.empty()) {
        Implicant* best_pi = nullptr;
        int max_covered = 0;

        for (auto& pi : prime_implicants) {
             bool already_in_solution = false;
            for(const auto& sol_imp : solution) {
                if(sol_imp == pi) {
                    already_in_solution = true;
                    break;
                }
            }
            if (already_in_solution) continue;
            
            int current_covered = 0;
            for (int mt : pi.minterms) {
                if (uncovered_minterms.count(mt)) {
                    current_covered++;
                }
            }
            if (current_covered > max_covered) {
                max_covered = current_covered;
                best_pi = &pi;
            }
        }

        if (best_pi) {
            solution.push_back(*best_pi);
            for (int mt : best_pi->minterms) {
                uncovered_minterms.erase(mt);
            }
        } else {
             // 더 이상 커버할 PI가 없는 경우 (이론상 발생하지 않아야 함)
             break;
        }
    }

    // 3단계: 결과 출력
    std::ofstream outputFile(output_file);
    if (!outputFile.is_open()) {
        std::cerr << "Error: output.txt 파일을 생성할 수 없습니다." << std::endl;
        return 1;
    }

    if (solution.empty()) {
        outputFile << "0"; // Minterm이 없는 경우
    } else {
        bool first_term = true;
        for (const auto& sol : solution) {
            if (!first_term) {
                outputFile << " | ";
            }
            outputFile << implicantToString(sol, num_bits);
            first_term = false;
        }
    }
    outputFile.close();


    return 0;
}