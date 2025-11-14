module cov_n_cycles_bind #(parameter int N = 100)(
  input logic clk,
  input logic rst,
  input logic invalid_program
);
  cover property (@(posedge clk) disable iff (rst)
    1[*0:$] ##1
    (invalid_program)
  );
endmodule

bind top cov_n_cycles_bind #(.N(100)) u_cov_n_cycles (
  .clk(clk),
  .rst(rst),
  .invalid_program(invalid_program)
);
