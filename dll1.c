/* dll1.c
 Example static dll 
 cannot access functions/variables of main !
*/

#if defined _MSC_VER || __MINGW64__
#include <windows.h>
#endif


#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// exported to main
int dll1_f1 ();
int dll1_int1 = 0;


// imports from main
extern int main_int1;
extern int main_export (char*);


int ii        = 0;


//================================================================
  int dll_f1 () {
//================================================================
// exported to main

  printf("\n- dll1: dll_f1; ii=%d\n",ii);

  ++ii;
  ++dll1_int1;

  //----------------------------------------------------------------
  printf("- dll1:  main_int1=%d\n",main_int1);
  main_export ("- dll1 - dll_f1");

  return ii;

}


// eof
