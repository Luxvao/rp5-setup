#!/bin/bash

cat <<EOF > 
<?xml version="1.0"?>
<inputList>
	<inputConfig type="controller" deviceName="Retroid Pocket Controller" deviceGUID="03008149202000000130000001000000">
		<input name="a" type="button" id="1" value="1" />
		<input name="b" type="button" id="0" value="1" />
		<input name="back" type="button" id="4" value="1" />
		<input name="down" type="button" id="12" value="1" />
		<input name="left" type="button" id="13" value="1" />
		<input name="leftshoulder" type="button" id="9" value="1" />
		<input name="leftthumbstickclick" type="button" id="7" value="1" />
		<input name="leftthumbstickdown" type="axis" id="1" value="1" />
		<input name="leftthumbstickleft" type="axis" id="0" value="-1" />
		<input name="leftthumbstickright" type="axis" id="0" value="1" />
		<input name="leftthumbstickup" type="axis" id="1" value="-1" />
		<input name="lefttrigger" type="axis" id="5" value="1" />
		<input name="right" type="button" id="14" value="1" />
		<input name="rightshoulder" type="button" id="10" value="1" />
		<input name="rightthumbstickclick" type="button" id="8" value="1" />
		<input name="rightthumbstickdown" type="axis" id="3" value="1" />
		<input name="rightthumbstickleft" type="axis" id="2" value="-1" />
		<input name="rightthumbstickright" type="axis" id="2" value="1" />
		<input name="rightthumbstickup" type="axis" id="3" value="-1" />
		<input name="righttrigger" type="axis" id="4" value="1" />
		<input name="start" type="button" id="6" value="1" />
		<input name="up" type="button" id="11" value="1" />
		<input name="x" type="button" id="2" value="1" />
		<input name="y" type="button" id="3" value="1" />
	</inputConfig>
</inputList>
EOF

chown $username /esde_input.xml
