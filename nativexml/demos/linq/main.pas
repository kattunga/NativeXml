unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NativeXml;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  XmlDoc: TNativeXml;
  Node: TXmlNode;
  i: Integer;
begin
  //Contributor: Marius Z
  //Here is the gist of what I mean. I implemented a few new functions into the
  //TNativeXml and TXmlNode classes. They enable creating multiple subnodes under
  //any node, on any layer of the created XML tree just by being invoked in a
  //nested way you can see in the example code below.
  //All those functions use open array parameters being attribute or node arrays
  //(array of TAttribute, array of TXmlNode).

  //Each of the nodes created using the functions I implemented may contain
  //multiple attributes; each node created this way may be returned through an
  //out parameter of those functions, so that it can be modified outside the
  //tree-like fragment of code representing the result XML structure.
  //(This possibility it's really useful as Delphi does not allow nested
  //assignments which fortunately can be substituted this way in this case).

  //You certainly noticed that this way of handling XML structures from Delphi
  //code is very similar to the one the XDocument allows (Microsoft Visual Studio,
  //.NET Framework (LINQ to XML, C#). Here is an example of what I'm talking about:
  //http://msdn.microsoft.com/en-us/library/system.xml.linq.xdocument.aspx.

  //I think this really facilitates handling XML documents. Please consider
  //implementing these methods into future versions of your code if you find
  //them OK. The naming of those methods may not be adjusted to the standard kept
  //within your classes, but please treat this modified code only as an example
  //to be improved.

  XmlDoc := TNativeXml.CreateName('Data');
  XmlDoc.XmlFormat := xfReadable;
  try
    //a new method added by me that enables adding multiple nodes to the current one
    XmlDoc.Root.NodesAdd([

      //new node being the first child of the root node
      XmlDoc.NodeNew('BasicData', [
        //nested string nodes 
        XmlDoc.NodeNewText('FirstName', 'John'),
        XmlDoc.NodeNewText('LastName', 'Doe'),

        //an new integer node
        XmlDoc.NodeNewInt('Age', 26)
      ]),

      //a comment node
      XmlDoc.NodeNewTextType('AComment1', 'My comment', xeComment),
      XmlDoc.NodeNewTextType('CDATA1', 'My CDATA', xeCData),

      //a node with multiple attributes and a subnode
      XmlDoc.NodeNewAttr('Address',
        [ //attributes
          XmlDoc.AttrText('City', 'Some city'),
          XmlDoc.AttrText('Street', 'Some street'),
          XmlDoc.AttrInt('Number', 555)
        ],
        [
          //subnode of the Address node containing text and attributes
          XmlDoc.NodeNewTextAttr('SomeSubnode', 'subnode text',
            [XmlDoc.AttrText('Attribute1', 'Attribute value')])
        ]
      ),

      //a new node that returns itself by the Node parameter, so that it can
      //be modified outside this fragment of code (see below)
      XmlDoc.NodeNewEx('AdditionalData', Node)
    ]);

    //the Node assigned in the above code and representing the AdditionalData node
    for i := 0 to 10 - 1 do
      Node.NodeNew('Node' + IntToStr(i));

    XmlDoc.SaveToFile('test.xml');
  finally
    XmlDoc.Free;
  end;

{here's the result:

<?xml version="1.0" encoding="UTF-8"?>
<Data>
	<BasicData>
		<FirstName>John</FirstName>
		<LastName>Doe</LastName>
		<Age>26</Age>
	</BasicData>
	<!--My comment-->
	<![CDATA[My CDATA]]>
	<Address City="Some city" Street="Some street" Number="555">
		<SomeSubnode Attribute1="Attribute value">subnode text</SomeSubnode>
	</Address>
	<AdditionalData>
		<Node0/>
		<Node1/>
		<Node2/>
		<Node3/>
		<Node4/>
		<Node5/>
		<Node6/>
		<Node7/>
		<Node8/>
		<Node9/>
	</AdditionalData>
</Data>

}

end;

end.
