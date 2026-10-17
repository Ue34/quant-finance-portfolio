let
    Source = Sql.Database("ActiveDirectoryServer", "BankingDB"),
    TargetTable = Source{[Schema="dbo", Item="ALM_Data_Raw"]}[Data],
    FilteredRows = Table.SelectRows(TargetTable, each ([Currency] = "HUF" or [Currency] = "EUR")),
    RemovedColumns = Table.RemoveColumns(FilteredRows,{"InternalAuditFlag", "ModifierID"}),
    ReplacedValues = Table.ReplaceValue(RemovedColumns, null, 0, Replacer.ReplaceValue, {"WeightedAverageRate"}),
    ChangedType = Table.TransformColumnTypes(ReplacedValues,{{"TotalPrincipal", Currency.Type}, {"ReportingMonth", type date}})
in
    ChangedType
