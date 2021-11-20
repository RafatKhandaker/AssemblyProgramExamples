#include <signal.h>
#include <stdio.h>
#include <string.h>

int main()
{
  char password[10]; // secret password
  char user_password[10]; // user-enterred password

  strncpy(password, "p@ssw0rd", 10); // copy "p@ssw0rd" into password
  printf("Actual password set to: %s\n", password); // print password

  gets(user_password); // get password from user
	
  if (0 == strncmp(user_password, password, 10))
  {
    // user was successfully authenticated
    printf("Success! The user was authenticated successfully.\n");
  }
  else
  {
    // user entered an incorrect password
    printf("Failure: The user could not be authenticated.\n");
  }

  printf("User-provided password: %s\n", user_password); // print user-entered password
  printf("Actual password: %s\n", password); // print secret password

  return 0;
}