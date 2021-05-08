simple Capa2
{
    parameters:
        @display("i=block/switch");
    gates:
        input in[];
        output out[];
}

network Spanning
{
    submodules:
        sw[6]: Capa2;
    connections:
        sw[0].out++ --> {  delay = 100ms; } --> sw[1].in++;
        sw[0].in++ <-- {  delay = 100ms; } <-- sw[1].out++;

        sw[1].out++ --> {  delay = 100ms; } --> sw[2].in++;
        sw[1].in++ <-- {  delay = 100ms; } <-- sw[2].out++;

        sw[2].out++ --> {  delay = 100ms; } --> sw[3].in++;
        sw[2].in++ <-- {  delay = 100ms; } <-- sw[3].out++;

        sw[3].out++ --> {  delay = 100ms; } --> sw[4].in++;
        sw[3].in++ <-- {  delay = 100ms; } <-- sw[4].out++;

        sw[4].out++ --> {  delay = 100ms; } --> sw[5].in++;
        sw[4].in++ <-- {  delay = 100ms; } <-- sw[5].out++;

        sw[5].out++ --> {  delay = 100ms; } --> sw[0].in++;
        sw[5].in++ <-- {  delay = 100ms; } <-- sw[0].out++;
}
