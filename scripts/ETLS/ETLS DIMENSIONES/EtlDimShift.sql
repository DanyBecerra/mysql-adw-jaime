INSERT INTO WhBG.DimShift (
    ShiftID_PK,
    StartTime,
    EndTime,
    ShiftName
)
select 
    S.ShiftID as ShiftID_PK,
    S.Name as ShiftName,
    S.StartTime as StartTime,
    S.EndTime as EndTime
    from adw.HumanResources_Shift S;