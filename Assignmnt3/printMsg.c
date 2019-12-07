#include "stm32f4xx.h"
#include <string.h>
void printMsgAND(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n LOGIC AND--------------------------");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }

	 void printMsgOR(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n LOGIC OR---------------------------");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }

void printMsgNOT(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n LOGIC NOT--------------------------");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }	

void printMsgNAND(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n LOGIC NAND-------------------------");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }	 

void printMsgNOR(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n LOGIC NOR--------------------------");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }	 
/*
void printMsg2p(const int a, const int b)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
}*/

void printMsg4p(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	 // Printing the first input X1
	sprintf(Msg,"\n X1:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the second input X2
	 sprintf(Msg,"\t X2:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the third input X3
	 sprintf(Msg,"\t X3:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the OUTPUT Y
	 sprintf(Msg,"\t OUT Y:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
	
}
