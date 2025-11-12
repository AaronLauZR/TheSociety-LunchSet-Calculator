unit LunchSetCalculator;

interface

uses
  System.Classes, System.Math, System.SysUtils, Vcl.Controls, Vcl.Forms,
  Vcl.Graphics, Vcl.StdCtrls,
  cxContainer, cxControls, cxEdit, cxGraphics, cxLookAndFeelPainters,
  cxLookAndFeels, cxTextEdit;

type
  TTheSocietyLunchSetCalculator_fm = class(TForm)
    lbMeal: TLabel;
    lbQty: TLabel;
    lbPrice: TLabel;
    lbMultiply: TLabel;
    lbEqual: TLabel;
    lbDiscount: TLabel;
    lbTax: TLabel;
    lbCopyright: TLabel;
    edMeal0: TcxTextEdit;
    edQty0: TcxTextEdit;
    edPrice0: TcxTextEdit;
    edDiscount: TcxTextEdit;
    edTax: TcxTextEdit;
    btnAdd: TButton;
    btnCalculate: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
  private
    FCount: Integer;
    procedure AddMeal;
  public
    procedure AfterConstruction; override;
  end;

var
  TheSocietyLunchSetCalculator_fm: TTheSocietyLunchSetCalculator_fm;

implementation

{$R *.dfm}

procedure TTheSocietyLunchSetCalculator_fm.AfterConstruction;
begin
  FCount := 0;
end;

procedure TTheSocietyLunchSetCalculator_fm.AddMeal;
var NewMeal, NewQty, NewPrice: TcxTextEdit;
    NewMultiply, NewEqual: TLabel;
begin
  NewMeal        := TcxTextEdit.Create(Self);
  NewMeal.Parent := Self;
  NewMeal.Height := edMeal0.Height;
  NewMeal.Width  := edMeal0.Width;
  NewMeal.Left   := edMeal0.Left;
  NewMeal.Top    := edMeal0.Top + (FCount * 29);
  NewMeal.Name   := 'edMeal' + FCount.ToString;
  NewMeal.Text   := '0.00';

  NewMultiply         := TLabel.Create(Self);
  NewMultiply.Parent  := Self;
  NewMultiply.Caption := lbMultiply.Caption;
  NewMultiply.Left    := lbMultiply.Left;
  NewMultiply.Top     := lbMultiply.Top + (FCount * 29);

  NewQty        := TcxTextEdit.Create(Self);
  NewQty.Parent := Self;
  NewQty.Height := edQty0.Height;
  NewQty.Width  := edQty0.Width;
  NewQty.Left   := edQty0.Left;
  NewQty.Top    := edQty0.Top + (FCount * 29);
  NewQty.Name   := 'edQty' + FCount.ToString;
  NewQty.Text   := '0';

  NewEqual         := TLabel.Create(Self);
  NewEqual.Parent  := Self;
  NewEqual.Caption := lbEqual.Caption;
  NewEqual.Left    := lbEqual.Left;
  NewEqual.Top     := lbEqual.Top + (FCount * 29);

  NewPrice                         := TcxTextEdit.Create(Self);
  NewPrice.Parent                  := Self;
  NewPrice.Enabled                 := False;
  NewPrice.StyleDisabled.TextColor := clWindowText;
  NewPrice.Height                  := edPrice0.Height;
  NewPrice.Width                   := edPrice0.Width;
  NewPrice.Left                    := edPrice0.Left;
  NewPrice.Top                     := edPrice0.Top + (FCount * 29);
  NewPrice.Name                    := 'edPrice' + FCount.ToString;
  NewPrice.Text                    := '';

  btnAdd.Top := btnAdd.Top + 29;
end;

procedure TTheSocietyLunchSetCalculator_fm.btnAddClick(Sender: TObject);
begin
  Inc(FCount);
  AddMeal;
end;

procedure TTheSocietyLunchSetCalculator_fm.btnCalculateClick(Sender: TObject);
var SubTotal, Discount, Tax, PortMeal, PortDis, PortTotal, PortPax: Double;
    Meal, Qty, Price: TcxTextEdit;
begin
  SubTotal := 0;
  Discount := StrToFloatDef(edDiscount.Text, 0);
  Tax      := StrToFloatDef(edTax.Text, 0) / 100;

  for var i := 0 to FCount do begin
    Meal := TcxTextEdit(FindComponent('edMeal' + i.ToString));
    Qty  := TcxTextEdit(FindComponent('edQty' + i.ToString));

    if not (Trim(Meal.Text).IsEmpty) and not (Meal.Text = '0.00') and not (Trim(Qty.Text).IsEmpty) and not (Qty.Text = '0') then
      SubTotal := SubTotal + (StrToFloatDef(Meal.Text, 0) * StrToFloatDef(Qty.Text, 0))
  end;

  if SubTotal = 0 then begin
    for var i := 0 to FCount do
      TcxTextEdit(FindComponent('edPrice' + i.ToString)).Text := 'Free';
    Exit;
  end;

  for var i := 0 to FCount do begin
    Meal  := TcxTextEdit(FindComponent('edMeal' + i.ToString));
    Qty   := TcxTextEdit(FindComponent('edQty' + i.ToString));
    Price := TcxTextEdit(FindComponent('edPrice' + i.ToString));

    if not (Trim(Meal.Text).IsEmpty) and not (Meal.Text = '0.00') and not (Trim(Qty.Text).IsEmpty) and not (Qty.Text = '0') then begin
      PortMeal  := (StrToFloatDef(Meal.Text, 0) * StrToFloatDef(Qty.Text, 0)) / Subtotal;
      PortDis   := Discount * PortMeal;
      PortTotal := (StrToFloatDef(Meal.Text, 0) * StrToFloatDef(Qty.Text, 0)) - PortDis;
      PortPax   := (PortTotal / StrToFloatDef(Qty.Text, 0)) * (1 + Tax);

      Price.Text := (RoundTo(PortPax, -2)).ToString;
    end else
      Price.Text := 'Free';
  end;
end;

end.
