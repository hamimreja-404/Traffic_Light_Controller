`timescale 1ns / 1ps
module Traffic_light(
    input clk,rst,
    output reg [2:0]signal
    );
    parameter RED = 3'b000,GREEN = 3'b010,YELLOW=3'b001;
    integer RED_TIME=20 , GREEN_TIME= 20;
    integer YELLOW_TIME = 5;
    integer counter;
    always @(posedge clk or negedge rst)
    begin
        if(rst)
        begin
            counter<=0;
            signal<=3'b000;
        end
        case(signal)
/*            3'bx:
            begin
                signal<=RED;
            end*/
            RED:
            begin
                if(RED_TIME>counter)
                begin
                    counter = counter+1;
                end
                else
                begin
                    signal<=YELLOW;
                    counter<=0;
                end 
            end
            YELLOW:
            begin
                if(YELLOW_TIME>counter)
                    counter=counter+1;
                else
                begin
                    signal<=GREEN;
                    counter<=0;
                end
            end
            GREEN:
            begin
                if(GREEN_TIME>counter)
                    counter = counter +1;
                else
                begin
                    signal<=RED;
                    counter<=0;
                end     
            end
            default:
            begin
                counter<=0;
                signal<=RED;
            end
            
        endcase
    end
    
endmodule
