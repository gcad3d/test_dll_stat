/* main.c
mainmodule  - using functions/variables of static dll dll1;
static dll dll1 cannot access functions/variables of main !
*/


#if defined _MSC_VER || __MINGW64__
#include <windows.h>
#endif

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// in dll1:
extern int dll_f1 ();
extern int dll1_int1;

int main_int1 = 0;


//================================================================
  int main (int argc, char *argv[]) {
//================================================================

  int          irc;
  char         s1[64];



  printf("\n=========================\n");
  printf(" main starting ..\n");


  //----------------------------------------------------------------
  L_start:
  ++main_int1;

  // call func in dll1
  irc = dll_f1 ("\n- main -");
  if(irc < 0) goto L_exit;

  printf ("- main: dll1_int1;=%d\n",dll1_int1);

  // get key from user; Esc to exit, CR to edit dll1.c
  printf("- key r CR for restart dll\n");
  printf("- key CR for exit\n");


  s1[0] = getchar ();
  if(s1[0] == 10) goto L_exit;
  s1[0] = getchar ();  // get char 10


  // get variable exported of dll1
  printf ("- main: dll1_int1=%d\n",dll1_int1);
  goto L_start;


  //----------------------------------------------------------------
  L_exit:
    printf("- exit main\n");
    printf("=========================\n\n");
  return 0;

}


//================================================================
  int main_export (char *txt) {
//================================================================
// func to be used by dll

  printf(" main_export |%s|\n",txt);

  return 0;

}


// EOF
