ObjectToXml demo
================

The purpose of this demo is to show how XML can be used as a storage mechanism
for any Delphi TObject descendant.

The unit NativeXmlObjectStorage.pas provides functionality to store any TObject descendant to an XML file or stream. Internally it makes full use of RTTI (runtime type information) in order to store all published properties and events.

It can even be used to copy forms, but form inheritance is not exploited, so child forms descending from parent forms store everything that the parent already stored.

All published properties and events of objects are stored. This includes the "DefineProperties". These are stored in binary form in the XML, encoded as BASE64.

Known limitations:

- The method and event lookup will not work correctly across forms.

Please see the "ObjectToXML" demo for example usage of NativeXmlObjectStorage.

Requirements
============

- The demo requires "NativeXml", which can be obtained from our website:
http://www.simdesign.nl/xml.html

NativeXml is open-source and available for free.

How to compile
==============

- Open the ObjectToXml.dpr project in your Delphi version
- Compile 

What does the demo do
=====================

- First simple test is to click on "Convert Image Object to XML". You will see that the "Image1" TImage component will be listed as a bunch of properties in the memo. 

- Then click "Load Image2 from XML". The XML data will be used to populate the properties of Image2 with a copy of properties of Image1. 

- You can check that events and references are copied, by clicking on Image2, the OnClick event is the same as in Image1. Rightclick and see that the reference to the popup-menu is also there.

- The image "Picture" property was also copied, including it's binary data. You can verify this in the XML:

  <Picture>(TPicture)
    <DefinedProperties>BERhd.....
      .....TDg0TDg==</DefinedProperties>
  </Picture>

- Now do something funny, edit the XML, for example:

  <Width>100</Width>            <- change
  <Height>70</Height>           <- change
  <AutoSize>False</AutoSize>    <- change
  <Stretch>True</Stretch>       <- add this line

- When you click "Load Image2 from XML" again, the image will show up smaller, as expected.

- What you can more do is copy the whole form to XML. First Clear the memo (not strictly neccesary), then click "Convert whole form to XML".

- You can create a cloned form by clicking "Create new form from XML". The form will be copied from the XML data, and show up (slightly displaced on purpose).

- Again, you can play around changing properties in the XML file to see the result.

- You can also save the XML to a file, and load + create the form from this external XML file. (Menu File > Save... and File > Load...). This allows you to edit the XML file you saved with your fav XML editor. 


Copyright (c) 2004 - 2011 Simdesign B.V., Author Nils Haeck M.Sc.

