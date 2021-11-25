syn match cType /\<[a-z_][0-9a-z_]*_t\>/
syn match cOperator /!/

syn match cValue /\<\(\u\a*\|\u[A-Z_]*\)\>/
hi def link cValue Constant

syn match cTypeName /\<\h\w*\>/ contained
syn cluster cParenGroup add=cTypeName
syn cluster cPreProcGroup add=cTypeName
hi def link cTypeName cType

syn clear cStructure
syn keyword cStructure struct union enum nextgroup=cTypeName skipwhite

syn match cFunctionDef /\<\h\w*\>\ze (/
hi def link cFunctionDef Function

syn match cThis /\<this\>/
hi def link cThis Special
