/* 
 * File:   main.c
 * Author: Steve
 *
 * Created on October 4, 2021, 7:48 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include"main.h"

/*Fortran C interoperability
 * 
 */
int main(int argc, char** argv) {

    /*Input integers*/
    int cinputnum = 123;
    int cinputnuma = 1234;
    int cinputnumb = 12345;
    int cinputnumc = 123456;
    int cinputnumd = 1234567;
    int cinputnume = 12345678;
    int cinputnumf = 123456789;
    int cinputnumg = 1234567891;

    char *formattedint = fortformatint(&cinputnum);
    printf(" First int %s \n\n", formattedint);

    char *formattedinta = fortformatint(&cinputnuma);
    printf(" Second int %s \n\n", formattedinta);

    char *formattedintb = fortformatint(&cinputnumb);
    printf(" Third int %s \n\n", formattedintb);

    char *formattedintc = fortformatint(&cinputnumc);
    printf(" Fourth int %s \n\n", formattedintc);

    char *formattedintd = fortformatint(&cinputnumd);
    printf(" Fifth int %s \n\n", formattedintd);

    char *formattedinte = fortformatint(&cinputnume);
    printf(" Sixth int %s \n\n", formattedinte);

    char *formattedintf = fortformatint(&cinputnumf);
    printf(" Seventh int %s \n\n", formattedintf);

    char *formattedintg = fortformatint(&cinputnumg);
    printf(" Eighth  int %s \n\n", formattedintg);

    return (EXIT_SUCCESS);
}

/*Output
 * 
 First int 123                                                

 Second int 1,234 

 Third int 12,345 

 Fourth int 123,456 

 Fifth int 1,234,567 

 Sixth int 12,345,678 

 Seventh int 123,456,789 

 Eighth  int 1,234,567,891 

 */