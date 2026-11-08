import time

# Returns the maximum of two numbers
def find_max(num1, num2):
    if num1 > num2:
        result = num1
    else:
        result = num2
    return result

# Define the main function of the code
def main():
    i = 51
    j = 20
    k = find_max(i, j)  # Call the find_max function
    print(f"The larger number of {i} and {j} is {k}")

if __name__ == "__main__":
    start_time = time.time()
    main()
    time.sleep(3)
    with open("duration.txt", "w") as myFile:
        myFile.write(f"Done in {time.time() - start_time} seconds.\n")

