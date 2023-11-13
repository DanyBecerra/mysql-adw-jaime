INSERT INTO WhBG.DimShift (
    Shift_ID,
    StartTime,
    EndTime,
    ShiftName
)
select 
    S.ShiftID as Shift_ID,
    S.Name as ShiftName,
    S.StartTime as StartTime,
    S.EndTime as EndTime
    from adw.HumanResources_Shift S;