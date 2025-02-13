        # import subprocess
        # import logging
        # import sys

        # # Set up logging to record all activity in a file.
        # logging.basicConfig(
        #     filename='package_update.log',      # Log file to save the update process details
        #     level=logging.INFO,                 # Record info-level messages and above (INFO, ERROR, etc.)
        #     format='%(asctime)s - %(levelname)s - %(message)s'
        # )


        # def run_shell_command(command):
        #     """
        #     Run a command in the shell and return its output.
        #     If the command fails, log the error and return None.
        #     """
        #     try:
        #         result = subprocess.run(
        #             command,
        #             shell=True,
        #             check=True,  # Raise an exception if the command fails
        #             stdout=subprocess.PIPE,
        #             stderr=subprocess.PIPE,
        #             text=True
        #         )
        #         return result.stdout
        #     except subprocess.CalledProcessError as error:
        #         logging.error(f"Command failed: {command}\nError: {error.stderr}")
        #         return None


        # def refresh_package_list():
        #     """
        #     Refresh the package list to get the latest available updates.
        #     This is like doing 'sudo apt update' in the terminal.
        #     """
        #     print("Refreshing the package list (this may prompt for your sudo password)...")
        #     logging.info("Refreshing package list with 'apt update'")
        #     output = run_shell_command("sudo apt update")
        #     if output is None:
        #         print("Uh-oh! The package list couldn't be updated. Please check your connection or permissions.")
        #         sys.exit(1)
        #     print("Package list refreshed successfully!")
        #     logging.info("Package list refreshed.")


        # def get_upgradable_packages():
        #     """
        #     Retrieve the list of packages that have updates available.
        #     It uses 'apt list --upgradable' and then extracts the package names.
        #     Returns a list of package names.
        #     """
        #     print("Finding out which packages can be updated...")
        #     output = run_shell_command("apt list --upgradable")
        #     if output is None:
        #         print("Error: Unable to retrieve the list of upgradable packages.")
        #         sys.exit(1)

        #     package_list = []
        #     lines = output.splitlines()
        #     # The first line is usually a header ("Listing...")
        #     for line in lines:
        #         if line.startswith("Listing..."):
        #             continue
        #         try:
        #             # Example line: "bash/now 5.0-6ubuntu1.1 amd64 [upgradable from: 5.0-6ubuntu1]"
        #             package_field = line.split()[0]     # "bash/now"
        #             package_name = package_field.split('/')[0]  # "bash"
        #             package_list.append(package_name)
        #         except Exception as error:
        #             logging.error(f"Could not parse line: {line}. Error: {error}")

        #     return package_list


        # def update_specific_package(package_name):
        #     """
        #     Update a specific package using apt-get install.
        #     This is equivalent to running 'sudo apt-get install -y <package_name>'.
        #     """
        #     print(f"Starting update for package: {package_name}")
        #     logging.info(f"Updating package: {package_name}")
        #     command = f"sudo apt-get install -y {package_name}"
        #     output = run_shell_command(command)
        #     if output is None:
        #         error_message = f"Oops! Updating package {package_name} failed."
        #         print(error_message)
        #         logging.error(error_message)
        #     else:
        #         print(f"Package {package_name} updated successfully!")
        #         logging.info(f"Package {package_name} updated successfully.")


        # def update_all_packages():
        #     """
        #     Update all packages that have updates available.
        #     This runs 'sudo apt-get upgrade -y' to update every package.
        #     """
        #     print("Updating ALL packages. Please be patient; this might take a while...")
        #     logging.info("Updating all packages with 'sudo apt-get upgrade -y'")
        #     command = "sudo apt-get upgrade -y"
        #     output = run_shell_command(command)
        #     if output is None:
        #         error_message = "Failed to update all packages."
        #         print(error_message)
        #         logging.error(error_message)
        #     else:
        #         print("All packages have been updated successfully!")
        #         logging.info("All packages updated successfully.")


        # def main():
        #     # First, update the package list to ensure we have the latest information.
        #     refresh_package_list()

        #     # Next, get the list of packages that can be updated.
        #     packages = get_upgradable_packages()

        #     if not packages:
        #         print("Great news! No updates are available at this time.")
        #         return

        #     # Show the list of packages along with an index for easy selection.
        #     print("\nThe following packages have updates available:")
        #     for index, pkg in enumerate(packages):
        #         print(f"  [{index}] {pkg}")

        #     # Ask the user whether they want to update all packages or choose specific ones.
        #     print("\nWould you like to update ALL packages, or just one (or more) of them?")
        #     print("Type 'all' to update everything, or enter the index number(s) of the package(s) you want to update.")
        #     user_choice = input("Your choice (e.g., all OR 0,2,3): ").strip().lower()

        #     if user_choice == "all":
        #         update_all_packages()
        #     else:
        #         # Handle the possibility of multiple indices (separated by commas)
        #         indices = user_choice.split(',')
        #         for index_str in indices:
        #             try:
        #                 index = int(index_str.strip())
        #                 if index < 0 or index >= len(packages):
        #                     print(f"Index {index} is out of range. Skipping.")
        #                     continue
        #                 package_name = packages[index]
        #                 update_specific_package(package_name)
        #             except ValueError:
        #                 print(f"Invalid input '{index_str}'. Please enter a number.")
        #                 continue

        #     print("\nUpdate process is complete. Check 'package_update.log' for more details.")


        # if __name__ == "__main__":
        #     main()
