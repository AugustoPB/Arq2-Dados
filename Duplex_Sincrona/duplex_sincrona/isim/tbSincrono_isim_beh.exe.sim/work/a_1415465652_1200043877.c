/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Augusto/Desktop/Duplex_Sincrona/CPU.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_1415465652_1200043877_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(27, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 4720);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4608);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1415465652_1200043877_p_1(char *t0)
{
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;

LAB0:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4624);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 7476);
    t6 = (t0 + 4784);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 4848);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(34, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t5 = (t0 + 4912);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t14 = *((unsigned char *)t6);
    t15 = (t14 == (unsigned char)3);
    if (t15 == 1)
        goto LAB13;

LAB14:    t13 = (unsigned char)0;

LAB15:    if (t13 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 4848);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(37, ng0);
    t8 = (t0 + 4848);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t17 = (t10 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(38, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7344U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t19, t2, t1, 1);
    t6 = (t19 + 12U);
    t20 = *((unsigned int *)t6);
    t21 = (1U * t20);
    t3 = (8U != t21);
    if (t3 == 1)
        goto LAB16;

LAB17:    t7 = (t0 + 4784);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t17 = *((char **)t10);
    memcpy(t17, t5, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(39, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 7376U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t19, t2, t1, 1);
    t6 = (t19 + 12U);
    t20 = *((unsigned int *)t6);
    t21 = (1U * t20);
    t3 = (16U != t21);
    if (t3 == 1)
        goto LAB18;

LAB19:    t7 = (t0 + 4912);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t17 = *((char **)t10);
    memcpy(t17, t5, 16U);
    xsi_driver_first_trans_fast(t7);
    goto LAB11;

LAB13:    t2 = (t0 + 2472U);
    t7 = *((char **)t2);
    t2 = (t0 + 7376U);
    t16 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t7, t2, 20);
    t13 = t16;
    goto LAB15;

LAB16:    xsi_size_not_matching(8U, t21, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(16U, t21, 0);
    goto LAB19;

}

static void work_a_1415465652_1200043877_p_2(char *t0)
{
    char t16[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4640);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t5 = t1;
    memset(t5, (unsigned char)2, 16U);
    t6 = (t0 + 4976);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1832U);
    t7 = *((char **)t2);
    t2 = (t0 + 5040);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    memcpy(t15, t7, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 7392U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t16, t2, t1, 1);
    t6 = (t16 + 12U);
    t17 = *((unsigned int *)t6);
    t18 = (1U * t17);
    t3 = (16U != t18);
    if (t3 == 1)
        goto LAB13;

LAB14:    t7 = (t0 + 4976);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    memcpy(t15, t5, 16U);
    xsi_driver_first_trans_fast(t7);
    goto LAB11;

LAB13:    xsi_size_not_matching(16U, t18, 0);
    goto LAB14;

}


extern void work_a_1415465652_1200043877_init()
{
	static char *pe[] = {(void *)work_a_1415465652_1200043877_p_0,(void *)work_a_1415465652_1200043877_p_1,(void *)work_a_1415465652_1200043877_p_2};
	xsi_register_didat("work_a_1415465652_1200043877", "isim/tbSincrono_isim_beh.exe.sim/work/a_1415465652_1200043877.didat");
	xsi_register_executes(pe);
}
