// verification/extra/cov_n_cycles_bind.sv
// 作用：生成一条至少 N 拍的 witness 轨迹，方便在“结束那一拍”看信号。
// 顶层名按你的脚本是 top；时钟/复位名是 clk / rst。

module cov_n_cycles_bind #(parameter int N = 100)(
  input logic clk,
  input logic rst
);
  // 复位释放后“空跑 N 拍”
  cover property (@(posedge clk) disable iff (rst) 1[*N]);
endmodule

// 绑定到顶层
bind top cov_n_cycles_bind #(.N(100)) u_cov_n_cycles (.clk(clk), .rst(rst));
