module ejer10_tb();
    logic a, b, c, clk, Z;
    ejer10 dut (a, b, c, clk, Z);

    always
    #4 clk = ~clk;

    initial
    begin
        a=0; b=0; c=0; #10;
        $display("Tiempo: %t, a = %b, b = %b, c = %b, clk = %b, Z = %b", $time, a, b, c, clk, Z);

        a=1; #5;
        $display("Tiempo: %t, a = %b, b = %b, c = %b, clk = %b, Z = %b", $time, a, b, c, clk, Z);

        b=1; #5;
        $display("Tiempo: %t, a = %b, b = %b, c = %b, clk = %b, Z = %b", $time, a, b, c, clk, Z);

        c=1; #10;
        $display("Tiempo: %t, a = %b, b = %b, c = %b, clk = %b, Z = %b", $time, a, b, c, clk, Z);

        b=0; c=0; #15 $stop;
        $display("Tiempo: %t, a = %b, b = %b, c = %b, clk = %b, Z = %b", $time, a, b, c, clk, Z);
    end

    initial
    clk = 1;
endmodule
