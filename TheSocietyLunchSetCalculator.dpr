program TheSocietyLunchSetCalculator;

uses
  Vcl.Forms,
  LunchSetCalculator in 'LunchSetCalculator.pas' {TheSocietyLunchSetCalculator_fm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTheSocietyLunchSetCalculator_fm, TheSocietyLunchSetCalculator_fm);
  Application.Run;
end.
