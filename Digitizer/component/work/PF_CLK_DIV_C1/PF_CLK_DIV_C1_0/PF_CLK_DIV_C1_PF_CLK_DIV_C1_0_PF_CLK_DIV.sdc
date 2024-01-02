set_component PF_CLK_DIV_C1_PF_CLK_DIV_C1_0_PF_CLK_DIV
create_generated_clock -source [ get_pins I_CD/A ] -multiply_by 1 -divide_by 4 [ get_pins I_CD/Y_DIV ]
