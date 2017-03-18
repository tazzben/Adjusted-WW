(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     16087,        616]
NotebookOptionsPosition[     14295,        532]
NotebookOutlinePosition[     14747,        552]
CellTagsIndexPosition[     14704,        549]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Expected Value of the Flow of Knowledge", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"flow", " ", "=", " ", 
  RowBox[{"\[Mu]", "-", "\[Alpha]", "+", "\[Gamma]", "+", 
   RowBox[{
    FractionBox["1", "n"], 
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Mu]", "-", "\[Gamma]", "+", "\[Alpha]"}], ")"}]}], 
   " ", "-", " ", 
   RowBox[{"(", 
    RowBox[{"\[Mu]", "+", 
     RowBox[{
      FractionBox["1", "n"], 
      RowBox[{"(", 
       RowBox[{"1", "-", "\[Mu]"}], ")"}]}]}], 
    ")"}]}]}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", "flow", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Limit", "[", 
  RowBox[{"flow", ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], 
  "]"}], "\[IndentingNewLine]"}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "\[Alpha]"}], "+", "\[Gamma]", "-", 
  FractionBox[
   RowBox[{"1", "-", "\[Mu]"}], "n"], "+", 
  FractionBox[
   RowBox[{"1", "+", "\[Alpha]", "-", "\[Gamma]", "-", "\[Mu]"}], 
   "n"]}]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "-", "\[Gamma]"}], ")"}]}], "n"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "\[Alpha]"}], "+", "\[Gamma]"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Expected Value of Positive Learning", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"pl", " ", "=", " ", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{"n", "-", "1"}], "n"], "\[Gamma]"}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Mu]", "-", "\[Gamma]"}], ")"}], 
    FractionBox["1", "n"], 
    FractionBox[
     RowBox[{"n", "-", "1"}], "n"]}]}]}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", "pl", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Limit", "[", 
  RowBox[{"pl", ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", "\[Gamma]"}], "n"], "+", 
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}], ")"}]}], 
   SuperscriptBox["n", "2"]]}]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{"1", "+", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", "\[Gamma]"}], "-", 
     "\[Mu]"}], ")"}]}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData["\[Gamma]"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Expected Value of Negative Learning", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"nl", " ", "=", " ", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{"n", "-", "1"}], "n"], "\[Alpha]"}], "+", " ", 
   RowBox[{
    FractionBox["1", "n"], 
    FractionBox[
     RowBox[{"n", "-", "1"}], "n"], 
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}], 
     ")"}]}]}]}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", "nl", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Limit", "[", 
  RowBox[{"nl", ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", "\[Alpha]"}], "n"], "+", 
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}], ")"}]}], 
   SuperscriptBox["n", "2"]]}]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{"1", "+", 
     RowBox[{"n", " ", "\[Alpha]"}], "-", "\[Gamma]", "-", "\[Mu]"}], ")"}]}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData["\[Alpha]"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Expected Value of Retained Learning", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"rl", " ", "=", " ", 
  RowBox[{"\[Mu]", "-", "\[Alpha]", " ", "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}], ")"}], 
    FractionBox["1", "n"], 
    FractionBox["1", "n"]}], "+", " ", 
   RowBox[{"\[Gamma]", 
    FractionBox["1", "n"]}], "+", 
   RowBox[{"\[Alpha]", 
    FractionBox["1", "n"]}]}]}], "\[IndentingNewLine]", 
 RowBox[{"Limit", "[", 
  RowBox[{"rl", ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "\[Alpha]"}], "+", 
  FractionBox["\[Alpha]", "n"], "+", 
  FractionBox["\[Gamma]", "n"], "+", 
  FractionBox[
   RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}], 
   SuperscriptBox["n", "2"]], "+", "\[Mu]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "\[Alpha]"}], "+", "\[Mu]"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Expected Value of Zero Learning", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"zl", " ", "=", " ", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"1", "-", "\[Mu]", "-", "\[Gamma]"}], ")"}], 
   FractionBox[
    RowBox[{"n", "-", "1"}], "n"], 
   FractionBox[
    RowBox[{"n", "-", "1"}], "n"]}]}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", "zl", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Limit", "[", 
  RowBox[{"zl", ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], "]"}]}], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], "2"], " ", 
   RowBox[{"(", 
    RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}], ")"}]}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "n"}], ")"}], "2"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]"}], ")"}]}], 
   SuperscriptBox["n", "2"]]}]], "Output"],

Cell[BoxData[
 RowBox[{"1", "-", "\[Gamma]", "-", "\[Mu]"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Solve for Estimators", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"epl", " ", "\[Equal]", " ", "pl"}], ",", " ", 
      RowBox[{"enl", " ", "==", " ", "nl"}], ",", " ", 
      RowBox[{"erl", "==", "rl"}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Mu]", ",", "\[Gamma]", ",", "\[Alpha]"}], "}"}]}], "]"}], " ",
   "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"\[Mu]", "\[Rule]", 
     RowBox[{"enl", "+", "erl", "+", 
      FractionBox[
       RowBox[{
        RowBox[{"-", "1"}], "+", "enl", "+", "erl"}], 
       RowBox[{
        RowBox[{"-", "1"}], "+", "n"}]]}]}], ",", 
    RowBox[{"\[Gamma]", "\[Rule]", 
     FractionBox[
      RowBox[{"n", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "enl", "+", "erl", "+", 
         RowBox[{"epl", " ", "n"}]}], ")"}]}], 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "n"}], ")"}], "2"]]}], ",", 
    RowBox[{"\[Alpha]", "\[Rule]", 
     FractionBox[
      RowBox[{"n", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "epl", "+", "erl", "+", 
         RowBox[{"enl", " ", "n"}]}], ")"}]}], 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "n"}], ")"}], "2"]]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[""], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Comparative Statics", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"pl", ",", "\[Mu]"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"nl", ",", "\[Mu]"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"zl", ",", "\[Mu]"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"rl", ",", "\[Mu]"}], "]"}], "]"}]}], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{"1", "-", "n"}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{"1", "-", "n"}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], "2"], 
   SuperscriptBox["n", "2"]]}]], "Output"],

Cell[BoxData[
 RowBox[{"1", "-", 
  FractionBox["1", 
   SuperscriptBox["n", "2"]]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"pl", ",", "n"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"nl", ",", "n"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"zl", ",", "n"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"D", "[", 
   RowBox[{"rl", ",", "n"}], "]"}], "]"}]}], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    RowBox[{"-", "2"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]"}], ")"}]}], "+", 
   RowBox[{"n", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", 
      RowBox[{"2", " ", "\[Gamma]"}], "+", "\[Mu]"}], ")"}]}]}], 
  SuperscriptBox["n", "3"]]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    RowBox[{"-", "2"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]"}], ")"}]}], "+", 
   RowBox[{"n", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]", "+", "\[Mu]"}], 
     ")"}]}]}], 
  SuperscriptBox["n", "3"]]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{"2", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "n"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]"}], ")"}]}], 
   SuperscriptBox["n", "3"]]}]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    RowBox[{"-", "n"}], " ", 
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "+", "\[Gamma]"}], ")"}]}], "+", 
   RowBox[{"2", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]"}], ")"}]}]}], 
  SuperscriptBox["n", "3"]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Comparing Bias", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"FullSimplify", "[", 
  RowBox[{"pl", " ", "-", " ", "\[Gamma]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"nl", " ", "-", " ", "\[Alpha]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"zl", " ", "-", 
   RowBox[{"(", 
    RowBox[{"1", "-", "\[Mu]", "-", "\[Gamma]"}], ")"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{"rl", " ", "-", 
   RowBox[{"(", 
    RowBox[{"\[Mu]", "-", "\[Alpha]"}], ")"}]}], "]"}]}], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]", "-", 
   RowBox[{"n", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", 
      RowBox[{"2", " ", "\[Gamma]"}], "+", "\[Mu]"}], ")"}]}]}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]", "-", 
   RowBox[{"n", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]", "+", "\[Mu]"}], 
     ")"}]}]}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", 
     RowBox[{"2", " ", "n"}]}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "\[Gamma]", "+", "\[Mu]"}], ")"}]}], 
  SuperscriptBox["n", "2"]]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{
    RowBox[{"-", "1"}], "+", "\[Gamma]", "-", 
    RowBox[{"n", " ", 
     RowBox[{"(", 
      RowBox[{"\[Alpha]", "+", "\[Gamma]"}], ")"}]}], "+", "\[Mu]"}], 
   SuperscriptBox["n", "2"]]}]], "Output"]
}, Open  ]],

Cell["\<\
Observed zl is smaller than the true value, while observed rl is greater than \
the true value.  There is no simple relationship for pl and nl.  \
\>", "Text"]
}, Open  ]]
},
WindowSize->{1154, 701},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"11.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (September \
21, 2016)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 61, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[1572, 39, 663, 19, 113, "Input"],
Cell[2238, 60, 238, 7, 44, "Output"],
Cell[2479, 69, 228, 8, 44, "Output"],
Cell[2710, 79, 82, 2, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[2841, 87, 57, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[2923, 91, 518, 15, 92, "Input"],
Cell[3444, 108, 390, 14, 45, "Output"],
Cell[3837, 124, 346, 13, 45, "Output"],
Cell[4186, 139, 35, 0, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[4270, 145, 57, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[4352, 149, 529, 16, 92, "Input"],
Cell[4884, 167, 390, 14, 45, "Output"],
Cell[5277, 183, 278, 9, 45, "Output"],
Cell[5558, 194, 35, 0, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[5642, 200, 57, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[5724, 204, 499, 14, 71, "Input"],
Cell[6226, 220, 256, 7, 45, "Output"],
Cell[6485, 229, 79, 2, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[6613, 237, 53, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[6691, 241, 439, 12, 92, "Input"],
Cell[7133, 255, 263, 9, 48, "Output"],
Cell[7399, 266, 311, 11, 48, "Output"],
Cell[7713, 279, 71, 1, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[7833, 286, 42, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[7900, 290, 398, 11, 32, "Input"],
Cell[8301, 303, 1002, 33, 49, "Output"]
}, Open  ]],
Cell[9318, 339, 26, 0, 32, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9381, 344, 41, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[9447, 348, 493, 12, 96, "Input"],
Cell[9943, 362, 95, 3, 45, "Output"],
Cell[10041, 367, 95, 3, 45, "Output"],
Cell[10139, 372, 189, 7, 48, "Output"],
Cell[10331, 381, 96, 3, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10464, 389, 477, 12, 96, "Input"],
Cell[10944, 403, 378, 13, 45, "Output"],
Cell[11325, 418, 374, 13, 45, "Output"],
Cell[11702, 433, 292, 10, 45, "Output"],
Cell[11997, 445, 322, 11, 45, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[12368, 462, 36, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[12429, 466, 538, 13, 96, "Input"],
Cell[12970, 481, 290, 9, 45, "Output"],
Cell[13263, 492, 286, 9, 45, "Output"],
Cell[13552, 503, 282, 10, 45, "Output"],
Cell[13837, 515, 258, 8, 45, "Output"]
}, Open  ]],
Cell[14110, 526, 169, 3, 30, "Text"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature #xp6UInNKgUsLBgzf7qJudL0 *)
