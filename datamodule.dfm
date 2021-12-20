object DM: TDM
  OnCreate = DataModuleCreate
  Height = 262
  Width = 567
  PixelsPerInch = 96
  object Fconn: TFDConnection
    Params.Strings = (
      'Database=FATWA.s3db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FconnAfterConnect
    Left = 72
    Top = 14
  end
  object FDQuery1: TFDQuery
    AfterScroll = FDQuery1AfterScroll
    Connection = Fconn
    SQL.Strings = (
      'select * from fatwa')
    Left = 72
    Top = 88
    object FDQuery1ID_fatwa: TFDAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 6
      FieldName = 'ID_fatwa'
      Origin = 'ID_fatwa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery1Mufti_name: TWideStringField
      DisplayLabel = #1575#1587#1605' '#1575#1604#1605#1601#1578#1610
      DisplayWidth = 13
      FieldName = 'Mufti_name'
      Origin = 'Mufti_name'
      Size = 300
    end
    object FDQuery1Fatwa_Title: TWideStringField
      DisplayLabel = #1593#1606#1608#1575#1606' '#1575#1604#1601#1578#1608#1609
      DisplayWidth = 25
      FieldName = 'Fatwa_Title'
      Origin = 'Fatwa_Title'
      Size = 250
    end
    object FDQuery1start_audio: TWideStringField
      DisplayLabel = #1576#1583#1575#1610#1577' '#1575#1604#1605#1602#1591#1593
      DisplayWidth = 8
      FieldName = 'start_audio'
      Origin = 'start_audio'
      Size = 10
    end
    object FDQuery1end_audio: TWideStringField
      DisplayLabel = #1606#1607#1575#1610#1577' '#1575#1604#1605#1602#1591#1593
      DisplayWidth = 8
      FieldName = 'end_audio'
      Origin = 'end_audio'
      Size = 10
    end
    object FDQuery1Fatwa_audio_loction: TWideStringField
      DisplayLabel = #1605#1587#1575#1585' '#1605#1602#1591#1593' '#1575#1604#1601#1578#1608#1609
      DisplayWidth = 30
      FieldName = 'Fatwa_audio_loction'
      Origin = 'Fatwa_audio_loction'
      Size = 500
    end
    object FDQuery1Fatwa_description: TWideStringField
      DisplayLabel = #1608#1589#1601' '#1575#1604#1601#1578#1608#1609
      DisplayWidth = 30
      FieldName = 'Fatwa_description'
      Origin = 'Fatwa_description'
      Size = 1000
    end
  end
end
