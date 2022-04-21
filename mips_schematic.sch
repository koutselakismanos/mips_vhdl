<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="CLEAR" />
        <signal name="COUNTER_OUTPUT(31:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="CLEAR" />
        <port polarity="Output" name="COUNTER_OUTPUT(31:0)" />
        <blockdef name="counter">
            <timestamp>2022-3-17T13:54:24</timestamp>
            <rect width="512" x="32" y="32" height="384" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="304" y2="304" x1="0" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="counter" name="XLXI_1">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="CLEAR" name="sclr" />
            <blockpin signalname="COUNTER_OUTPUT(31:0)" name="q(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="1040" y="1392" name="CLEAR" orien="R180" />
        <iomarker fontsize="28" x="1008" y="1296" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="1936" y="1232" name="COUNTER_OUTPUT(31:0)" orien="R0" />
        <instance x="1328" y="1088" name="XLXI_1" orien="R0">
        </instance>
        <branch name="COUNTER_OUTPUT(31:0)">
            <wire x2="1936" y1="1232" y2="1232" x1="1904" />
        </branch>
        <branch name="CLEAR">
            <wire x2="1328" y1="1392" y2="1392" x1="1040" />
        </branch>
        <branch name="CLK">
            <wire x2="1312" y1="1296" y2="1296" x1="1008" />
            <wire x2="1328" y1="1296" y2="1296" x1="1312" />
        </branch>
    </sheet>
</drawing>