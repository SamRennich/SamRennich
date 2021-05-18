#include <iostream>
#include <vector>

// Constants
const int range = 1000; // Sets the upper limit of where to find primes

// Prototypes
std::vector<int> createVector(); // Creates the vector with numbers from 0 to range
void primeSeive(std::vector<int>); // Removes all non-primes leaving only primes in the vector

int main() {
	
	// Create initial vector
	std::vector<int> primes = createVector();
	
	// Sort, leaving only primes
	//primeSeive(primes);
	
	// Print vector
	for (int i = 0; i < (primes.size() - 1); i++) {
		std::cout << primes[i] << ", ";
	}
	std::cout << primes[primes.size() - 1] << std::endl;

	//Exit
	std::cin.clear();
    getchar();
    return 0;
}

// Creates the vector with numbers from 0 to range
std::vector<int> createVector() {
	
	std::vector<int> primes;
	
	for (int i = 0; i < range; i++) {
		primes[i] = i + 1;
	}
	
	return primes; // Finish
}

// Removes all non-primes leaving only primes in the vector
void primeSeive(std::vector<int> primes) {
	
	for (int i = 0; i < (range / 2); i++) {
		
		int j = i + 1;
		
		while (j < primes.size()) {
			if (primes[j] % primes[i] == 0) {
				primes.erase(primes.begin() + j);
			} else {
				j++;
			}
		}
	}
	
	return; // Finish
}