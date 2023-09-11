`timescale 1ns / 100ps

module comp_8bits_tb;

reg    [7:0] a_t, b_t;

wire   gt, lt, eq;

reg    gt_gold, lt_gold, eq_gold;

integer err_count;

integer i;
integer seed1;
integer seed2;

//assign random input values to cra_8bits

initial
begin
  
  seed1=1;
  seed2=2;
  
  err_count=0; 

  for(i=0; i<1000; i=i+1)
     begin
         a_t=$random(seed1);
         b_t=$random(seed2);
			
         gt_gold=(a_t>b_t);
			lt_gold=(a_t<b_t);
			eq_gold=(a_t==b_t);
			
         #10 //$display ($time, " a_t=%d b_t=%d gt_gold=%b lt_gold=%b eq_gold=%b", a_t, b_t, gt_gold, lt_gold, eq_gold);
				 //$display ($time, " a_t=%d b_t=%d gt=%b lt=%b eq=%b\n", a_t, b_t, gt, lt, eq);         
         
			if ({gt,lt,eq}!=={gt_gold, lt_gold, eq_gold})
         begin
             err_count=err_count+1;
				 $display ($time, " An error occurred !");
             $display ($time, " a_t=%d b_t=%d gt_gold=%b lt_gold=%b eq_gold=%b", a_t, b_t, gt_gold, lt_gold, eq_gold);
				 $display ($time, " a_t=%d b_t=%d gt=%b lt=%b eq=%b\n", a_t, b_t, gt, lt, eq);
         end
      end

    $display(" ");
    $display("-------------------------------------------------------\n");
    $display("--------------------- S U M M A R Y -------------------\n");

    if(err_count==0)
         $display("Congratulations! The results are all PASSED!!\n");
    else
         $display("FAIL!!!  There are %d errors! \n", err_count);
	  
    $display("-------------------------------------------------------\n");
  #10 $stop;	 
  #10 $finish;       

end


compare_8bits inst1(//input
                 .a(a_t),            
                 .b(b_t),

                 //output 
                 .gt(gt),
					  .lt(lt),
					  .eq(eq)
                 );

endmodule
