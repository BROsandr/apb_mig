interface apb_if #(
  parameter type addr_t = apb_mig_pkg::apb_addr_t,
  parameter type data_t = apb_mig_pkg::data_t
) (
  input logic pclk_i,
  input logic preset_ni
);
  typedef logic [$bits(addr_t)/$bits(byte)-1:0] strb_t;

// START protocol signals
  addr_t paddr;
  data_t pwdata;
  logic  pwrite;
  logic  psel;
  logic  penable;
  data_t prdata;
  logic  pready;
  logic  pslverr;
  strb_t pstrb;
// END protocol signals

// START modports
  modport slave (
    input .pclk_i   (pclk_i),
    input .preset_ni (preset_ni),

    input .paddr_i   (paddr),
    input .pwdata_i  (pwdata),
    input .pwrite_i  (pwrite),
    input .psel_i    (psel),
    input .penable_i (penable),
    input .pstrb_i   (pstrb),

    output .prdata_o  (prdata),
    output .pready_o  (pready),
    output .pslverr_o (pslverr)
  );

  modport master (
    input .pclk_i   (pclk_i),
    input .preset_ni (preset_ni),

    input .prdata_o  (prdata),
    input .pready_o  (pready),
    input .pslverr_o (pslverr),

    output .paddr_i   (paddr),
    output .pwdata_i  (pwdata),
    output .pwrite_i  (pwrite),
    output .psel_i    (psel),
    output .penable_i (penable),
    output .pstrb_i   (pstrb)
  );
// END modports

  `include "apb_if_sva.svh"
endinterface
