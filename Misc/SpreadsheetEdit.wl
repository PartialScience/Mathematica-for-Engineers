(* ::Package:: *)

BeginPackage["SpreadsheetEdit`"];


SpreadsheetEdit::usage = "SpreadsheetEdit[data] allows you to edit data using your system's built-in spreadsheet editor"


Begin["Private`"]


ClearAll[SpreadsheetEdit]
SpreadsheetEdit[in___]:=Module[{waiting,file,ProcListOld,ProcListNew,SheetProc,SheetProcPID,ProcClosedQ,out},
waiting=True;
PrintTemporary[Button["Click When Done",waiting=False;]];
If[Length[{in}]==0,
file=Export[$TemporaryDirectory<>"\\"<>CreateUUID[]<>"-Input.csv",{{Null,Null}}],
file=Export[$TemporaryDirectory<>"\\"<>CreateUUID[]<>"-Input.csv",in]
];
SystemOpen[file];
While[waiting];
out=Import[file]
]


End[]


EndPackage[]
