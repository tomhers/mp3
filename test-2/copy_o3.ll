declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
@str.Object = internal constant [7 x i8] c"Object\00", align 1
%Object = type {
	%Object_vtable*
}

%Object_vtable = type {
	i32,
	i32,
	i8*,
	%Object* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@Object_vtable_prototype = constant %Object_vtable {
	i32 0,
	i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00", align 1
%Int = type {
	%Int_vtable*,
	i32
}

%Int_vtable = type {
	i32,
	i32,
	i8*,
	%Int* () *,
	%Object* (%Int*) *,
	%String* (%Int*) *,
	%Int* (%Int*) *
}

@Int_vtable_prototype = constant %Int_vtable {
	i32 1,
	i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
	%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
	%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

@str.Bool = internal constant [5 x i8] c"Bool\00", align 1
%Bool = type {
	%Bool_vtable*,
	i1
}

%Bool_vtable = type {
	i32,
	i32,
	i8*,
	%Bool* () *,
	%Object* (%Bool*) *,
	%String* (%Bool*) *,
	%Bool* (%Bool*) *
}

@Bool_vtable_prototype = constant %Bool_vtable {
	i32 2,
	i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
	%String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
	%Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

@str.String = internal constant [7 x i8] c"String\00", align 1
%String = type {
	%String_vtable*,
	i8*
}

%String_vtable = type {
	i32,
	i32,
	i8*,
	%String* () *,
	%Object* (%String*) *,
	%String* (%String*) *,
	%String* (%String*) *,
	i32 (%String*) *,
	%String* (%String*,%String*) *,
	%String* (%String*,i32,i32) *
}

@String_vtable_prototype = constant %String_vtable {
	i32 3,
	i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
	%String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
	%String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00", align 1
%IO = type {
	%IO_vtable*
}

%IO_vtable = type {
	i32,
	i32,
	i8*,
	%IO* () *,
	%Object* (%IO*) *,
	%String* (%IO*) *,
	%IO* (%IO*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *
}

@IO_vtable_prototype = constant %IO_vtable {
	i32 4,
	i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
	%String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
	%IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00", align 1
%Main = type {
	%Main_vtable*
}

%Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%Main* (%Main*,%String*) *,
	%Main* (%Main*,i32) *,
	%String* (%Main*) *,
	i32 (%Main*) *,
	%Main* (%Main*) *
}

@Main_vtable_prototype = constant %Main_vtable {
	i32 5,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
	%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
	%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
	i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
	%Main* (%Main*) * @Main_main
}

@str.A = internal constant [2 x i8] c"A\00", align 1
%A = type {
	%A_vtable*,
	i32,
	i1,
	%String*,
	i32
}

%A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *
}

@A_vtable_prototype = constant %A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
}

@str.AA = internal constant [3 x i8] c"AA\00", align 1
%AA = type {
	%AA_vtable*,
	i32,
	i1,
	%String*,
	i32,
	i1,
	i32
}

%AA_vtable = type {
	i32,
	i32,
	i8*,
	%AA* () *,
	%Object* (%AA*) *,
	%String* (%AA*) *,
	%AA* (%AA*) *,
	i32 (%AA*,i32) *,
	i32 (%AA*) *
}

@AA_vtable_prototype = constant %AA_vtable {
	i32 7,
	i32 ptrtoint (%AA* getelementptr (%AA, %AA* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.AA, i32 0, i32 0),
	%AA* () * @AA_new,
	%Object* (%AA*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%AA*) *),
	%String* (%AA*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%AA*) *),
	%AA* (%AA*) * bitcast (%Object* (%Object*) * @Object_copy to %AA* (%AA*) *),
	i32 (%AA*,i32) * @AA_set,
	i32 (%AA*) * @AA_get
}

@str.3 = internal constant [14 x i8] c"<basic class>\00", align 1
@String.3 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [8 x i8] c"Error2\0A\00", align 1
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [8 x i8] c"Error1\0A\00", align 1
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [11 x i8] c"copy_o3.cl\00", align 1
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call %Main*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define %Main* @Main_main(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = alloca %A*
	store %A* null, %A** %tmp.1
	%tmp.2 = alloca %A*
	store %A* null, %A** %tmp.2
	%tmp.3 = call %AA* @AA_new(  )
	%tmp.4 = bitcast %AA* %tmp.3 to %A*
	store %A* %tmp.4, %A** %tmp.1
	%tmp.5 = load %A*, %A** %tmp.1
	%tmp.6 = icmp eq %A* %tmp.5, null
	br i1 %tmp.6, label %abort, label %ok.0

ok.0:
	%tmp.7 = getelementptr %A, %A* %tmp.5, i32 0, i32 0
	%tmp.8 = load %A_vtable*, %A_vtable** %tmp.7
	%tmp.9 = getelementptr %A_vtable, %A_vtable* %tmp.8, i32 0, i32 0
	%tmp.10 = load i32, i32* %tmp.9
	br label %case.hdr.0

case.hdr.0:
	%tmp.11 = alloca %Int*
	br label %case.7.0

case.7.0:
	%vtpm.0 = icmp slt i32 %tmp.10, 7
	br i1 %vtpm.0, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.1 = icmp sgt i32 %tmp.10, 7
	br i1 %vtpm.1, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.2 = alloca %AA*
	%tmp.12 = bitcast %A* %tmp.5 to %AA*
	store %AA* %tmp.12, %AA** %vtpm.2
	%tmp.13 = load %AA*, %AA** %vtpm.2
	%tmp.14 = icmp eq %AA* %tmp.13, null
	br i1 %tmp.14, label %abort, label %ok.1

ok.1:
	%tmp.15 = getelementptr %AA, %AA* %tmp.13, i32 0, i32 0
	%tmp.16 = load %AA_vtable*, %AA_vtable** %tmp.15
	%tmp.17 = getelementptr %AA_vtable, %AA_vtable* %tmp.16, i32 0, i32 7
	%tmp.18 = load i32 (%AA*,i32) *, i32 (%AA*,i32) ** %tmp.17
	%tmp.19 = call i32(%AA*, i32) %tmp.18( %AA* %tmp.13, i32 42 )
	%tmp.21 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.21, i32 %tmp.19 )
	%tmp.22 = bitcast %Int* %tmp.21 to %Object*
	%tmp.23 = bitcast %Object* %tmp.22 to %Int*
	store %Int* %tmp.23, %Int** %tmp.11
	br label %case.exit.0

br_exit.7.0:
	br label %case.0.0

case.0.0:
	%vtpm.3 = icmp slt i32 %tmp.10, 0
	br i1 %vtpm.3, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.4 = icmp sgt i32 %tmp.10, 7
	br i1 %vtpm.4, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%vtpm.5 = alloca %Object*
	%tmp.24 = bitcast %A* %tmp.5 to %Object*
	store %Object* %tmp.24, %Object** %vtpm.5
	%tmp.25 = load %Main*, %Main** %tmp.0
	%tmp.26 = icmp eq %Main* %tmp.25, null
	br i1 %tmp.26, label %abort, label %ok.2

ok.2:
	%tmp.27 = getelementptr %Main, %Main* %tmp.25, i32 0, i32 0
	%tmp.28 = load %Main_vtable*, %Main_vtable** %tmp.27
	%tmp.29 = getelementptr %Main_vtable, %Main_vtable* %tmp.28, i32 0, i32 7
	%tmp.30 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.29
	%tmp.31 = call %Main*(%Main*, %String*) %tmp.30( %Main* %tmp.25, %String* @String.1 )
	%tmp.32 = bitcast %Main* %tmp.31 to %Object*
	%tmp.33 = bitcast %Object* %tmp.32 to %Int*
	store %Int* %tmp.33, %Int** %tmp.11
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.34 = load %Int*, %Int** %tmp.11
	%tmp.35 = load %A*, %A** %tmp.1
	%tmp.36 = icmp eq %A* %tmp.35, null
	br i1 %tmp.36, label %abort, label %ok.3

ok.3:
	%tmp.37 = getelementptr %A, %A* %tmp.35, i32 0, i32 0
	%tmp.38 = load %A_vtable*, %A_vtable** %tmp.37
	%tmp.39 = getelementptr %A_vtable, %A_vtable* %tmp.38, i32 0, i32 6
	%tmp.40 = load %A* (%A*) *, %A* (%A*) ** %tmp.39
	%tmp.41 = call %A*(%A*) %tmp.40( %A* %tmp.35 )
	store %A* %tmp.41, %A** %tmp.2
	%tmp.42 = load %A*, %A** %tmp.2
	%tmp.43 = icmp eq %A* %tmp.42, null
	br i1 %tmp.43, label %abort, label %ok.4

ok.4:
	%tmp.44 = getelementptr %A, %A* %tmp.42, i32 0, i32 0
	%tmp.45 = load %A_vtable*, %A_vtable** %tmp.44
	%tmp.46 = getelementptr %A_vtable, %A_vtable* %tmp.45, i32 0, i32 0
	%tmp.47 = load i32, i32* %tmp.46
	br label %case.hdr.1

case.hdr.1:
	%tmp.48 = alloca %Main*
	br label %case.7.1

case.7.1:
	%vtpm.6 = icmp slt i32 %tmp.47, 7
	br i1 %vtpm.6, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.7 = icmp sgt i32 %tmp.47, 7
	br i1 %vtpm.7, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.8 = alloca %AA*
	%tmp.49 = bitcast %A* %tmp.42 to %AA*
	store %AA* %tmp.49, %AA** %vtpm.8
	%tmp.50 = load %AA*, %AA** %vtpm.8
	%tmp.51 = icmp eq %AA* %tmp.50, null
	br i1 %tmp.51, label %abort, label %ok.6

ok.6:
	%tmp.52 = getelementptr %AA, %AA* %tmp.50, i32 0, i32 0
	%tmp.53 = load %AA_vtable*, %AA_vtable** %tmp.52
	%tmp.54 = getelementptr %AA_vtable, %AA_vtable* %tmp.53, i32 0, i32 8
	%tmp.55 = load i32 (%AA*) *, i32 (%AA*) ** %tmp.54
	%tmp.56 = call i32(%AA*) %tmp.55( %AA* %tmp.50 )
	%tmp.57 = load %Main*, %Main** %tmp.0
	%tmp.58 = icmp eq %Main* %tmp.57, null
	br i1 %tmp.58, label %abort, label %ok.5

ok.5:
	%tmp.59 = getelementptr %Main, %Main* %tmp.57, i32 0, i32 0
	%tmp.60 = load %Main_vtable*, %Main_vtable** %tmp.59
	%tmp.61 = getelementptr %Main_vtable, %Main_vtable* %tmp.60, i32 0, i32 8
	%tmp.62 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %tmp.61
	%tmp.63 = call %Main*(%Main*, i32) %tmp.62( %Main* %tmp.57, i32 %tmp.56 )
	store %Main* %tmp.63, %Main** %tmp.48
	br label %case.exit.1

br_exit.7.1:
	br label %case.0.1

case.0.1:
	%vtpm.9 = icmp slt i32 %tmp.47, 0
	br i1 %vtpm.9, label %br_exit.0.1, label %src_gte_br.0.1

src_gte_br.0.1:
	%vtpm.10 = icmp sgt i32 %tmp.47, 7
	br i1 %vtpm.10, label %br_exit.0.1, label %src_lte_mc.0.1

src_lte_mc.0.1:
	%vtpm.11 = alloca %Object*
	%tmp.64 = bitcast %A* %tmp.42 to %Object*
	store %Object* %tmp.64, %Object** %vtpm.11
	%tmp.65 = load %Main*, %Main** %tmp.0
	%tmp.66 = icmp eq %Main* %tmp.65, null
	br i1 %tmp.66, label %abort, label %ok.7

ok.7:
	%tmp.67 = getelementptr %Main, %Main* %tmp.65, i32 0, i32 0
	%tmp.68 = load %Main_vtable*, %Main_vtable** %tmp.67
	%tmp.69 = getelementptr %Main_vtable, %Main_vtable* %tmp.68, i32 0, i32 7
	%tmp.70 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.69
	%tmp.71 = call %Main*(%Main*, %String*) %tmp.70( %Main* %tmp.65, %String* @String.2 )
	store %Main* %tmp.71, %Main** %tmp.48
	br label %case.exit.1

br_exit.0.1:
	br label %abort

case.exit.1:
	%tmp.72 = load %Main*, %Main** %tmp.48
	%tmp.73 = load %Main*, %Main** %tmp.0
	ret %Main* %tmp.73

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.74 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.75 = load i32, i32* %tmp.74
	%tmp.76 = call i8*(i32) @malloc( i32 %tmp.75 )
	%tmp.77 = bitcast i8* %tmp.76 to %Main*
	%tmp.78 = getelementptr %Main, %Main* %tmp.77, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.78
	%tmp.79 = alloca %Main*
	store %Main* %tmp.77, %Main** %tmp.79
	ret %Main* %tmp.77

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%tmp.0 = getelementptr %A_vtable, %A_vtable* @A_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %A*
	%tmp.4 = getelementptr %A, %A* %tmp.3, i32 0, i32 0
	store %A_vtable* @A_vtable_prototype, %A_vtable** %tmp.4
	%tmp.5 = alloca %A*
	store %A* %tmp.3, %A** %tmp.5
	%tmp.6 = getelementptr %A, %A* %tmp.3, i32 0, i32 1
	store i32 0, i32* %tmp.6
	%tmp.7 = getelementptr %A, %A* %tmp.3, i32 0, i32 2
	store i1 false, i1* %tmp.7
	%tmp.8 = getelementptr %A, %A* %tmp.3, i32 0, i32 3
	%tmp.9 = call %String* @String_new(  )
	store %String* %tmp.9, %String** %tmp.8
	%tmp.10 = getelementptr %A, %A* %tmp.3, i32 0, i32 4
	store i32 0, i32* %tmp.10
	ret %A* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA_set(%AA* %self, i32 %x) {

entry:
	%tmp.0 = alloca %AA*
	store %AA* %self, %AA** %tmp.0
	%tmp.1 = alloca i32
	store i32 %x, i32* %tmp.1
	%tmp.2 = load i32, i32* %tmp.1
	%tmp.3 = load %AA*, %AA** %tmp.0
	%tmp.4 = getelementptr %AA, %AA* %tmp.3, i32 0, i32 6
	store i32 %tmp.2, i32* %tmp.4
	ret i32 %tmp.2

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA_get(%AA* %self) {

entry:
	%tmp.5 = alloca %AA*
	store %AA* %self, %AA** %tmp.5
	%tmp.6 = load %AA*, %AA** %tmp.5
	%tmp.7 = getelementptr %AA, %AA* %tmp.6, i32 0, i32 6
	%tmp.8 = load i32, i32* %tmp.7
	ret i32 %tmp.8

abort:
	call void @abort(  )
	unreachable
}

define %AA* @AA_new() {

entry:
	%tmp.9 = getelementptr %AA_vtable, %AA_vtable* @AA_vtable_prototype, i32 0, i32 1
	%tmp.10 = load i32, i32* %tmp.9
	%tmp.11 = call i8*(i32) @malloc( i32 %tmp.10 )
	%tmp.12 = bitcast i8* %tmp.11 to %AA*
	%tmp.13 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 0
	store %AA_vtable* @AA_vtable_prototype, %AA_vtable** %tmp.13
	%tmp.14 = alloca %AA*
	store %AA* %tmp.12, %AA** %tmp.14
	%tmp.15 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 1
	store i32 0, i32* %tmp.15
	%tmp.16 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 2
	store i1 false, i1* %tmp.16
	%tmp.17 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 3
	%tmp.18 = call %String* @String_new(  )
	store %String* %tmp.18, %String** %tmp.17
	%tmp.19 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 4
	store i32 0, i32* %tmp.19
	%tmp.20 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 5
	store i1 false, i1* %tmp.20
	%tmp.21 = getelementptr %AA, %AA* %tmp.12, i32 0, i32 6
	store i32 0, i32* %tmp.21
	ret %AA* %tmp.12

abort:
	call void @abort(  )
	unreachable
}

