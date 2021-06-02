controladdin Wysiwyg
{
    RequestedHeight = 600;
    MinimumHeight = 600;
    MaximumHeight = 600;
    VerticalStretch = true;
    HorizontalStretch = true;
    Scripts = 'Editor/Scripts/ckeditor.js', 'Editor/Scripts/MainScript.js';
    StartupScript = 'Editor/Scripts/startupScript.js';
    RecreateScript = 'Editor/Scripts/recreateScript.js';
    StyleSheets = 'Editor/Stylesheet/styles.css';
    RefreshScript = 'Editor/Scripts/refreshScript.js';

    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure Init();
    procedure Load(data: Text);
    procedure RequestSave();
    procedure SetReadOnly(readonly: boolean);
}

page 50100 "Test Wysiwyg"
{
    layout
    {
        area(Content)
        {
            usercontrol(Test; Wysiwyg)
            {
                ApplicationArea = All;
                trigger ControlReady()
                begin
                    CurrPage.Test.Init();
                    CurrPage.Test.Load('This is a <strong>BOLD</strong> statement!');
                end;

                trigger SaveRequested(data: Text)
                begin
                    Message(data);
                end;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(Save)
            {
                trigger OnAction()
                begin
                    CurrPage.Test.RequestSave();
                end;

            }
        }
    }
}