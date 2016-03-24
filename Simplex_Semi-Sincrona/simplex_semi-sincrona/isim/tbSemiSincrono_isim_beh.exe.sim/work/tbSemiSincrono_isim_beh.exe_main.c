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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_1599810257;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *IEEE_P_2592010699;
char *WORK_P_3265946935;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_p_1599810257_init();
    work_p_3265946935_init();
    work_a_1415465652_1200043877_init();
    work_a_2660114623_0152434546_init();
    work_a_3335194990_2639693326_init();
    work_a_0995218538_1375922058_init();
    work_a_2217407890_2217407890_init();


    xsi_register_tops("work_a_2217407890_2217407890");

    WORK_P_1599810257 = xsi_get_engine_memory("work_p_1599810257");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    WORK_P_3265946935 = xsi_get_engine_memory("work_p_3265946935");
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}
