module compare_8bits(a,b,gt,lt,eq);

input[7:0] a,b;


output gt,lt,eq;

reg gt,lt,eq;

always@(a,b)
begin:comp_loop

integer i;
reg[8:0] gt_tmp,eq_tmp,lt_tmp;

gt_tmp=9'b000000000;
eq_tmp=9'b100000000;
lt_tmp=9'b000000000;
for(i=7;i>=0;i=i-1)
begin
	{gt_tmp[i],lt_tmp[i],eq_tmp[i]}=comp(a[i],b[i],gt_tmp[i+1],lt_tmp[i+1],eq_tmp[i+1]);
end
{gt,lt,eq}={gt_tmp[0],lt_tmp[0],eq_tmp[0]};
end


function[2:0] comp;
input ai,bi;
input gt_in,lt_in,eq_in;

reg gt_out,lt_out,eq_out;
begin 
gt_out=gt_in|(eq_in&ai&(~bi));
lt_out=lt_in|(eq_in&(~ai)&bi);
eq_out=(eq_in&(ai==bi));

comp={gt_out,lt_out,eq_out};
end


endfunction

endmodule