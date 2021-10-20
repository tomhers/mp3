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
	%Main_vtable*,
	%String*,
	%A*,
	%A*,
	i1
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
	%String* (%Main*) *,
	%String* (%Main*) *,
	i32 (%Main*) *,
	i1 (%Main*,i32) *,
	%Main* (%Main*,%A*) *,
	%Main* (%Main*,%A*) *,
	%Object* (%Main*) *
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
	%String* (%Main*) * @Main_menu,
	%String* (%Main*) * @Main_prompt,
	i32 (%Main*) * @Main_get_int,
	i1 (%Main*,i32) * @Main_is_even,
	%Main* (%Main*,%A*) * @Main_class_type,
	%Main* (%Main*,%A*) * @Main_print,
	%Object* (%Main*) * @Main_main
}

@str.A = internal constant [2 x i8] c"A\00", align 1
%A = type {
	%A_vtable*,
	i32
}

%A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *,
	i32 (%A*) *,
	%A* (%A*,i32) *,
	%A* (%A*,i32) *,
	%B* (%A*,i32,i32) *,
	%C* (%A*,i32) *,
	%D* (%A*,i32,i32) *,
	%E* (%A*,i32) *
}

@A_vtable_prototype = constant %A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	i32 (%A*) * @A_value,
	%A* (%A*,i32) * @A_set_var,
	%A* (%A*,i32) * @A_method1,
	%B* (%A*,i32,i32) * @A_method2,
	%C* (%A*,i32) * @A_method3,
	%D* (%A*,i32,i32) * @A_method4,
	%E* (%A*,i32) * @A_method5
}

@str.B = internal constant [2 x i8] c"B\00", align 1
%B = type {
	%B_vtable*,
	i32
}

%B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *,
	i32 (%B*) *,
	%B* (%B*,i32) *,
	%B* (%B*,i32) *,
	%B* (%B*,i32,i32) *,
	%C* (%B*,i32) *,
	%D* (%B*,i32,i32) *,
	%E* (%B*,i32) *
}

@B_vtable_prototype = constant %B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *),
	i32 (%B*) * bitcast (i32 (%A*) * @A_value to i32 (%B*) *),
	%B* (%B*,i32) * bitcast (%A* (%A*,i32) * @A_set_var to %B* (%B*,i32) *),
	%B* (%B*,i32) * bitcast (%A* (%A*,i32) * @A_method1 to %B* (%B*,i32) *),
	%B* (%B*,i32,i32) * bitcast (%B* (%A*,i32,i32) * @A_method2 to %B* (%B*,i32,i32) *),
	%C* (%B*,i32) * bitcast (%C* (%A*,i32) * @A_method3 to %C* (%B*,i32) *),
	%D* (%B*,i32,i32) * bitcast (%D* (%A*,i32,i32) * @A_method4 to %D* (%B*,i32,i32) *),
	%E* (%B*,i32) * @B_method5
}

@str.C = internal constant [2 x i8] c"C\00", align 1
%C = type {
	%C_vtable*,
	i32
}

%C_vtable = type {
	i32,
	i32,
	i8*,
	%C* () *,
	%Object* (%C*) *,
	%String* (%C*) *,
	%C* (%C*) *,
	i32 (%C*) *,
	%C* (%C*,i32) *,
	%C* (%C*,i32) *,
	%B* (%C*,i32,i32) *,
	%C* (%C*,i32) *,
	%D* (%C*,i32,i32) *,
	%E* (%C*,i32) *,
	%A* (%C*,i32) *
}

@C_vtable_prototype = constant %C_vtable {
	i32 8,
	i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0),
	%C* () * @C_new,
	%Object* (%C*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%C*) *),
	%String* (%C*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%C*) *),
	%C* (%C*) * bitcast (%Object* (%Object*) * @Object_copy to %C* (%C*) *),
	i32 (%C*) * bitcast (i32 (%A*) * @A_value to i32 (%C*) *),
	%C* (%C*,i32) * bitcast (%A* (%A*,i32) * @A_set_var to %C* (%C*,i32) *),
	%C* (%C*,i32) * bitcast (%A* (%A*,i32) * @A_method1 to %C* (%C*,i32) *),
	%B* (%C*,i32,i32) * bitcast (%B* (%A*,i32,i32) * @A_method2 to %B* (%C*,i32,i32) *),
	%C* (%C*,i32) * bitcast (%C* (%A*,i32) * @A_method3 to %C* (%C*,i32) *),
	%D* (%C*,i32,i32) * bitcast (%D* (%A*,i32,i32) * @A_method4 to %D* (%C*,i32,i32) *),
	%E* (%C*,i32) * @C_method5,
	%A* (%C*,i32) * @C_method6
}

@str.D = internal constant [2 x i8] c"D\00", align 1
%D = type {
	%D_vtable*,
	i32
}

%D_vtable = type {
	i32,
	i32,
	i8*,
	%D* () *,
	%Object* (%D*) *,
	%String* (%D*) *,
	%D* (%D*) *,
	i32 (%D*) *,
	%D* (%D*,i32) *,
	%D* (%D*,i32) *,
	%B* (%D*,i32,i32) *,
	%C* (%D*,i32) *,
	%D* (%D*,i32,i32) *,
	%E* (%D*,i32) *,
	i1 (%D*,i32) *
}

@D_vtable_prototype = constant %D_vtable {
	i32 9,
	i32 ptrtoint (%D* getelementptr (%D, %D* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.D, i32 0, i32 0),
	%D* () * @D_new,
	%Object* (%D*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%D*) *),
	%String* (%D*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%D*) *),
	%D* (%D*) * bitcast (%Object* (%Object*) * @Object_copy to %D* (%D*) *),
	i32 (%D*) * bitcast (i32 (%A*) * @A_value to i32 (%D*) *),
	%D* (%D*,i32) * bitcast (%A* (%A*,i32) * @A_set_var to %D* (%D*,i32) *),
	%D* (%D*,i32) * bitcast (%A* (%A*,i32) * @A_method1 to %D* (%D*,i32) *),
	%B* (%D*,i32,i32) * bitcast (%B* (%A*,i32,i32) * @A_method2 to %B* (%D*,i32,i32) *),
	%C* (%D*,i32) * bitcast (%C* (%A*,i32) * @A_method3 to %C* (%D*,i32) *),
	%D* (%D*,i32,i32) * bitcast (%D* (%A*,i32,i32) * @A_method4 to %D* (%D*,i32,i32) *),
	%E* (%D*,i32) * bitcast (%E* (%B*,i32) * @B_method5 to %E* (%D*,i32) *),
	i1 (%D*,i32) * @D_method7
}

@str.E = internal constant [2 x i8] c"E\00", align 1
%E = type {
	%E_vtable*,
	i32
}

%E_vtable = type {
	i32,
	i32,
	i8*,
	%E* () *,
	%Object* (%E*) *,
	%String* (%E*) *,
	%E* (%E*) *,
	i32 (%E*) *,
	%E* (%E*,i32) *,
	%E* (%E*,i32) *,
	%B* (%E*,i32,i32) *,
	%C* (%E*,i32) *,
	%D* (%E*,i32,i32) *,
	%E* (%E*,i32) *,
	i1 (%E*,i32) *,
	%A* (%E*,i32) *
}

@E_vtable_prototype = constant %E_vtable {
	i32 10,
	i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0),
	%E* () * @E_new,
	%Object* (%E*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%E*) *),
	%String* (%E*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%E*) *),
	%E* (%E*) * bitcast (%Object* (%Object*) * @Object_copy to %E* (%E*) *),
	i32 (%E*) * bitcast (i32 (%A*) * @A_value to i32 (%E*) *),
	%E* (%E*,i32) * bitcast (%A* (%A*,i32) * @A_set_var to %E* (%E*,i32) *),
	%E* (%E*,i32) * bitcast (%A* (%A*,i32) * @A_method1 to %E* (%E*,i32) *),
	%B* (%E*,i32,i32) * bitcast (%B* (%A*,i32,i32) * @A_method2 to %B* (%E*,i32,i32) *),
	%C* (%E*,i32) * bitcast (%C* (%A*,i32) * @A_method3 to %C* (%E*,i32) *),
	%D* (%E*,i32,i32) * bitcast (%D* (%A*,i32,i32) * @A_method4 to %D* (%E*,i32,i32) *),
	%E* (%E*,i32) * bitcast (%E* (%B*,i32) * @B_method5 to %E* (%E*,i32) *),
	i1 (%E*,i32) * bitcast (i1 (%D*,i32) * @D_method7 to i1 (%E*,i32) *),
	%A* (%E*,i32) * @E_method6
}

@str.A2I = internal constant [4 x i8] c"A2I\00", align 1
%A2I = type {
	%A2I_vtable*
}

%A2I_vtable = type {
	i32,
	i32,
	i8*,
	%A2I* () *,
	%Object* (%A2I*) *,
	%String* (%A2I*) *,
	%A2I* (%A2I*) *,
	i32 (%A2I*,%String*) *,
	%String* (%A2I*,i32) *,
	i32 (%A2I*,%String*) *,
	i32 (%A2I*,%String*) *,
	%String* (%A2I*,i32) *,
	%String* (%A2I*,i32) *
}

@A2I_vtable_prototype = constant %A2I_vtable {
	i32 11,
	i32 ptrtoint (%A2I* getelementptr (%A2I, %A2I* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.A2I, i32 0, i32 0),
	%A2I* () * @A2I_new,
	%Object* (%A2I*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A2I*) *),
	%String* (%A2I*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A2I*) *),
	%A2I* (%A2I*) * bitcast (%Object* (%Object*) * @Object_copy to %A2I* (%A2I*) *),
	i32 (%A2I*,%String*) * @A2I_c2i,
	%String* (%A2I*,i32) * @A2I_i2c,
	i32 (%A2I*,%String*) * @A2I_a2i,
	i32 (%A2I*,%String*) * @A2I_a2i_aux,
	%String* (%A2I*,i32) * @A2I_i2a,
	%String* (%A2I*,i32) * @A2I_i2a_aux
}

@str.58 = internal constant [14 x i8] c"<basic class>\00", align 1
@String.58 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.58, i32 0, i32 0)
}

@str.57 = internal constant [2 x i8] c"q\00", align 1
@String.57 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.57, i32 0, i32 0)
}

@str.56 = internal constant [2 x i8] c"j\00", align 1
@String.56 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.56, i32 0, i32 0)
}

@str.55 = internal constant [29 x i8] c"times 8 with a remainder of \00", align 1
@String.55 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([29 x i8], [29 x i8]* @str.55, i32 0, i32 0)
}

@str.54 = internal constant [13 x i8] c"is equal to \00", align 1
@String.54 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.54, i32 0, i32 0)
}

@str.53 = internal constant [2 x i8] c"h\00", align 1
@String.53 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.53, i32 0, i32 0)
}

@str.52 = internal constant [24 x i8] c"is not divisible by 3.\0A\00", align 1
@String.52 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([24 x i8], [24 x i8]* @str.52, i32 0, i32 0)
}

@str.51 = internal constant [20 x i8] c"is divisible by 3.\0A\00", align 1
@String.51 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([20 x i8], [20 x i8]* @str.51, i32 0, i32 0)
}

@str.50 = internal constant [2 x i8] c"g\00", align 1
@String.50 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.50, i32 0, i32 0)
}

@str.49 = internal constant [2 x i8] c"f\00", align 1
@String.49 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.49, i32 0, i32 0)
}

@str.48 = internal constant [2 x i8] c"e\00", align 1
@String.48 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.48, i32 0, i32 0)
}

@str.47 = internal constant [2 x i8] c"d\00", align 1
@String.47 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.47, i32 0, i32 0)
}

@str.46 = internal constant [2 x i8] c"c\00", align 1
@String.46 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.46, i32 0, i32 0)
}

@str.45 = internal constant [2 x i8] c"b\00", align 1
@String.45 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.45, i32 0, i32 0)
}

@str.44 = internal constant [2 x i8] c"a\00", align 1
@String.44 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.44, i32 0, i32 0)
}

@str.43 = internal constant [9 x i8] c"is odd!\0A\00", align 1
@String.43 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([9 x i8], [9 x i8]* @str.43, i32 0, i32 0)
}

@str.42 = internal constant [10 x i8] c"is even!\0A\00", align 1
@String.42 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @str.42, i32 0, i32 0)
}

@str.41 = internal constant [8 x i8] c"number \00", align 1
@String.41 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.41, i32 0, i32 0)
}

@str.40 = internal constant [2 x i8] c" \00", align 1
@String.40 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.40, i32 0, i32 0)
}

@str.39 = internal constant [8 x i8] c"Oooops\0A\00", align 1
@String.39 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.39, i32 0, i32 0)
}

@str.38 = internal constant [21 x i8] c"Class type is now E\0A\00", align 1
@String.38 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.38, i32 0, i32 0)
}

@str.37 = internal constant [21 x i8] c"Class type is now D\0A\00", align 1
@String.37 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.37, i32 0, i32 0)
}

@str.36 = internal constant [21 x i8] c"Class type is now C\0A\00", align 1
@String.36 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.36, i32 0, i32 0)
}

@str.35 = internal constant [21 x i8] c"Class type is now B\0A\00", align 1
@String.35 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.35, i32 0, i32 0)
}

@str.34 = internal constant [21 x i8] c"Class type is now A\0A\00", align 1
@String.34 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.34, i32 0, i32 0)
}

@str.33 = internal constant [27 x i8] c"Please enter a number...  \00", align 1
@String.33 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([27 x i8], [27 x i8]* @str.33, i32 0, i32 0)
}

@str.32 = internal constant [2 x i8] c"\0A\00", align 1
@String.32 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.32, i32 0, i32 0)
}

@str.31 = internal constant [22 x i8] c"\09To quit...enter q:\0A\0A\00", align 1
@String.31 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([22 x i8], [22 x i8]* @str.31, i32 0, i32 0)
}

@str.30 = internal constant [33 x i8] c"\09To get a new number...enter j:\0A\00", align 1
@String.30 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([33 x i8], [33 x i8]* @str.30, i32 0, i32 0)
}

@str.29 = internal constant [17 x i8] c"by 8...enter h:\0A\00", align 1
@String.29 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([17 x i8], [17 x i8]* @str.29, i32 0, i32 0)
}

@str.28 = internal constant [12 x i8] c"\09To divide \00", align 1
@String.28 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @str.28, i32 0, i32 0)
}

@str.27 = internal constant [31 x i8] c"is a multiple of 3...enter g:\0A\00", align 1
@String.27 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([31 x i8], [31 x i8]* @str.27, i32 0, i32 0)
}

@str.26 = internal constant [17 x i8] c"\09To find out if \00", align 1
@String.26 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([17 x i8], [17 x i8]* @str.26, i32 0, i32 0)
}

@str.25 = internal constant [13 x i8] c"...enter f:\0A\00", align 1
@String.25 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.25, i32 0, i32 0)
}

@str.24 = internal constant [10 x i8] c"\09To cube \00", align 1
@String.24 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @str.24, i32 0, i32 0)
}

@str.23 = internal constant [13 x i8] c"...enter e:\0A\00", align 1
@String.23 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.23, i32 0, i32 0)
}

@str.22 = internal constant [12 x i8] c"\09To square \00", align 1
@String.22 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @str.22, i32 0, i32 0)
}

@str.21 = internal constant [13 x i8] c"...enter d:\0A\00", align 1
@String.21 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.21, i32 0, i32 0)
}

@str.20 = internal constant [27 x i8] c"\09To find the factorial of \00", align 1
@String.20 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([27 x i8], [27 x i8]* @str.20, i32 0, i32 0)
}

@str.19 = internal constant [31 x i8] c"and another number...enter c:\0A\00", align 1
@String.19 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([31 x i8], [31 x i8]* @str.19, i32 0, i32 0)
}

@str.18 = internal constant [33 x i8] c"\09To find the difference between \00", align 1
@String.18 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([33 x i8], [33 x i8]* @str.18, i32 0, i32 0)
}

@str.17 = internal constant [13 x i8] c"...enter b:\0A\00", align 1
@String.17 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.17, i32 0, i32 0)
}

@str.16 = internal constant [12 x i8] c"\09To negate \00", align 1
@String.16 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @str.16, i32 0, i32 0)
}

@str.15 = internal constant [13 x i8] c"...enter a:\0A\00", align 1
@String.15 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.15, i32 0, i32 0)
}

@str.14 = internal constant [22 x i8] c"\0A\09To add a number to \00", align 1
@String.14 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([22 x i8], [22 x i8]* @str.14, i32 0, i32 0)
}

@str.13 = internal constant [2 x i8] c"+\00", align 1
@String.13 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.13, i32 0, i32 0)
}

@str.12 = internal constant [2 x i8] c"-\00", align 1
@String.12 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.12, i32 0, i32 0)
}

@str.11 = internal constant [1 x i8] c"\00", align 1
@String.11 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([1 x i8], [1 x i8]* @str.11, i32 0, i32 0)
}

@str.10 = internal constant [2 x i8] c"9\00", align 1
@String.10 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.10, i32 0, i32 0)
}

@str.9 = internal constant [2 x i8] c"8\00", align 1
@String.9 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.9, i32 0, i32 0)
}

@str.8 = internal constant [2 x i8] c"7\00", align 1
@String.8 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.8, i32 0, i32 0)
}

@str.7 = internal constant [2 x i8] c"6\00", align 1
@String.7 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.7, i32 0, i32 0)
}

@str.6 = internal constant [2 x i8] c"5\00", align 1
@String.6 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.6, i32 0, i32 0)
}

@str.5 = internal constant [2 x i8] c"4\00", align 1
@String.5 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.5, i32 0, i32 0)
}

@str.4 = internal constant [2 x i8] c"3\00", align 1
@String.4 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.4, i32 0, i32 0)
}

@str.3 = internal constant [2 x i8] c"2\00", align 1
@String.3 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [2 x i8] c"1\00", align 1
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [2 x i8] c"0\00", align 1
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [9 x i8] c"arith.cl\00", align 1
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([9 x i8], [9 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call %Object*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define %String* @Main_menu(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = load %Main*, %Main** %tmp.0
	%tmp.2 = icmp eq %Main* %tmp.1, null
	br i1 %tmp.2, label %abort, label %ok.0

ok.0:
	%tmp.3 = getelementptr %Main, %Main* %tmp.1, i32 0, i32 0
	%tmp.4 = load %Main_vtable*, %Main_vtable** %tmp.3
	%tmp.5 = getelementptr %Main_vtable, %Main_vtable* %tmp.4, i32 0, i32 7
	%tmp.6 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.5
	%tmp.7 = call %Main*(%Main*, %String*) %tmp.6( %Main* %tmp.1, %String* @String.14 )
	%tmp.8 = load %Main*, %Main** %tmp.0
	%tmp.9 = getelementptr %Main, %Main* %tmp.8, i32 0, i32 2
	%tmp.10 = load %A*, %A** %tmp.9
	%tmp.11 = load %Main*, %Main** %tmp.0
	%tmp.12 = icmp eq %Main* %tmp.11, null
	br i1 %tmp.12, label %abort, label %ok.1

ok.1:
	%tmp.13 = getelementptr %Main, %Main* %tmp.11, i32 0, i32 0
	%tmp.14 = load %Main_vtable*, %Main_vtable** %tmp.13
	%tmp.15 = getelementptr %Main_vtable, %Main_vtable* %tmp.14, i32 0, i32 16
	%tmp.16 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.15
	%tmp.17 = call %Main*(%Main*, %A*) %tmp.16( %Main* %tmp.11, %A* %tmp.10 )
	%tmp.18 = load %Main*, %Main** %tmp.0
	%tmp.19 = icmp eq %Main* %tmp.18, null
	br i1 %tmp.19, label %abort, label %ok.2

ok.2:
	%tmp.20 = getelementptr %Main, %Main* %tmp.18, i32 0, i32 0
	%tmp.21 = load %Main_vtable*, %Main_vtable** %tmp.20
	%tmp.22 = getelementptr %Main_vtable, %Main_vtable* %tmp.21, i32 0, i32 7
	%tmp.23 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.22
	%tmp.24 = call %Main*(%Main*, %String*) %tmp.23( %Main* %tmp.18, %String* @String.15 )
	%tmp.25 = load %Main*, %Main** %tmp.0
	%tmp.26 = icmp eq %Main* %tmp.25, null
	br i1 %tmp.26, label %abort, label %ok.3

ok.3:
	%tmp.27 = getelementptr %Main, %Main* %tmp.25, i32 0, i32 0
	%tmp.28 = load %Main_vtable*, %Main_vtable** %tmp.27
	%tmp.29 = getelementptr %Main_vtable, %Main_vtable* %tmp.28, i32 0, i32 7
	%tmp.30 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.29
	%tmp.31 = call %Main*(%Main*, %String*) %tmp.30( %Main* %tmp.25, %String* @String.16 )
	%tmp.32 = load %Main*, %Main** %tmp.0
	%tmp.33 = getelementptr %Main, %Main* %tmp.32, i32 0, i32 2
	%tmp.34 = load %A*, %A** %tmp.33
	%tmp.35 = load %Main*, %Main** %tmp.0
	%tmp.36 = icmp eq %Main* %tmp.35, null
	br i1 %tmp.36, label %abort, label %ok.4

ok.4:
	%tmp.37 = getelementptr %Main, %Main* %tmp.35, i32 0, i32 0
	%tmp.38 = load %Main_vtable*, %Main_vtable** %tmp.37
	%tmp.39 = getelementptr %Main_vtable, %Main_vtable* %tmp.38, i32 0, i32 16
	%tmp.40 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.39
	%tmp.41 = call %Main*(%Main*, %A*) %tmp.40( %Main* %tmp.35, %A* %tmp.34 )
	%tmp.42 = load %Main*, %Main** %tmp.0
	%tmp.43 = icmp eq %Main* %tmp.42, null
	br i1 %tmp.43, label %abort, label %ok.5

ok.5:
	%tmp.44 = getelementptr %Main, %Main* %tmp.42, i32 0, i32 0
	%tmp.45 = load %Main_vtable*, %Main_vtable** %tmp.44
	%tmp.46 = getelementptr %Main_vtable, %Main_vtable* %tmp.45, i32 0, i32 7
	%tmp.47 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.46
	%tmp.48 = call %Main*(%Main*, %String*) %tmp.47( %Main* %tmp.42, %String* @String.17 )
	%tmp.49 = load %Main*, %Main** %tmp.0
	%tmp.50 = icmp eq %Main* %tmp.49, null
	br i1 %tmp.50, label %abort, label %ok.6

ok.6:
	%tmp.51 = getelementptr %Main, %Main* %tmp.49, i32 0, i32 0
	%tmp.52 = load %Main_vtable*, %Main_vtable** %tmp.51
	%tmp.53 = getelementptr %Main_vtable, %Main_vtable* %tmp.52, i32 0, i32 7
	%tmp.54 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.53
	%tmp.55 = call %Main*(%Main*, %String*) %tmp.54( %Main* %tmp.49, %String* @String.18 )
	%tmp.56 = load %Main*, %Main** %tmp.0
	%tmp.57 = getelementptr %Main, %Main* %tmp.56, i32 0, i32 2
	%tmp.58 = load %A*, %A** %tmp.57
	%tmp.59 = load %Main*, %Main** %tmp.0
	%tmp.60 = icmp eq %Main* %tmp.59, null
	br i1 %tmp.60, label %abort, label %ok.7

ok.7:
	%tmp.61 = getelementptr %Main, %Main* %tmp.59, i32 0, i32 0
	%tmp.62 = load %Main_vtable*, %Main_vtable** %tmp.61
	%tmp.63 = getelementptr %Main_vtable, %Main_vtable* %tmp.62, i32 0, i32 16
	%tmp.64 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.63
	%tmp.65 = call %Main*(%Main*, %A*) %tmp.64( %Main* %tmp.59, %A* %tmp.58 )
	%tmp.66 = load %Main*, %Main** %tmp.0
	%tmp.67 = icmp eq %Main* %tmp.66, null
	br i1 %tmp.67, label %abort, label %ok.8

ok.8:
	%tmp.68 = getelementptr %Main, %Main* %tmp.66, i32 0, i32 0
	%tmp.69 = load %Main_vtable*, %Main_vtable** %tmp.68
	%tmp.70 = getelementptr %Main_vtable, %Main_vtable* %tmp.69, i32 0, i32 7
	%tmp.71 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.70
	%tmp.72 = call %Main*(%Main*, %String*) %tmp.71( %Main* %tmp.66, %String* @String.19 )
	%tmp.73 = load %Main*, %Main** %tmp.0
	%tmp.74 = icmp eq %Main* %tmp.73, null
	br i1 %tmp.74, label %abort, label %ok.9

ok.9:
	%tmp.75 = getelementptr %Main, %Main* %tmp.73, i32 0, i32 0
	%tmp.76 = load %Main_vtable*, %Main_vtable** %tmp.75
	%tmp.77 = getelementptr %Main_vtable, %Main_vtable* %tmp.76, i32 0, i32 7
	%tmp.78 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.77
	%tmp.79 = call %Main*(%Main*, %String*) %tmp.78( %Main* %tmp.73, %String* @String.20 )
	%tmp.80 = load %Main*, %Main** %tmp.0
	%tmp.81 = getelementptr %Main, %Main* %tmp.80, i32 0, i32 2
	%tmp.82 = load %A*, %A** %tmp.81
	%tmp.83 = load %Main*, %Main** %tmp.0
	%tmp.84 = icmp eq %Main* %tmp.83, null
	br i1 %tmp.84, label %abort, label %ok.10

ok.10:
	%tmp.85 = getelementptr %Main, %Main* %tmp.83, i32 0, i32 0
	%tmp.86 = load %Main_vtable*, %Main_vtable** %tmp.85
	%tmp.87 = getelementptr %Main_vtable, %Main_vtable* %tmp.86, i32 0, i32 16
	%tmp.88 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.87
	%tmp.89 = call %Main*(%Main*, %A*) %tmp.88( %Main* %tmp.83, %A* %tmp.82 )
	%tmp.90 = load %Main*, %Main** %tmp.0
	%tmp.91 = icmp eq %Main* %tmp.90, null
	br i1 %tmp.91, label %abort, label %ok.11

ok.11:
	%tmp.92 = getelementptr %Main, %Main* %tmp.90, i32 0, i32 0
	%tmp.93 = load %Main_vtable*, %Main_vtable** %tmp.92
	%tmp.94 = getelementptr %Main_vtable, %Main_vtable* %tmp.93, i32 0, i32 7
	%tmp.95 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.94
	%tmp.96 = call %Main*(%Main*, %String*) %tmp.95( %Main* %tmp.90, %String* @String.21 )
	%tmp.97 = load %Main*, %Main** %tmp.0
	%tmp.98 = icmp eq %Main* %tmp.97, null
	br i1 %tmp.98, label %abort, label %ok.12

ok.12:
	%tmp.99 = getelementptr %Main, %Main* %tmp.97, i32 0, i32 0
	%tmp.100 = load %Main_vtable*, %Main_vtable** %tmp.99
	%tmp.101 = getelementptr %Main_vtable, %Main_vtable* %tmp.100, i32 0, i32 7
	%tmp.102 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.101
	%tmp.103 = call %Main*(%Main*, %String*) %tmp.102( %Main* %tmp.97, %String* @String.22 )
	%tmp.104 = load %Main*, %Main** %tmp.0
	%tmp.105 = getelementptr %Main, %Main* %tmp.104, i32 0, i32 2
	%tmp.106 = load %A*, %A** %tmp.105
	%tmp.107 = load %Main*, %Main** %tmp.0
	%tmp.108 = icmp eq %Main* %tmp.107, null
	br i1 %tmp.108, label %abort, label %ok.13

ok.13:
	%tmp.109 = getelementptr %Main, %Main* %tmp.107, i32 0, i32 0
	%tmp.110 = load %Main_vtable*, %Main_vtable** %tmp.109
	%tmp.111 = getelementptr %Main_vtable, %Main_vtable* %tmp.110, i32 0, i32 16
	%tmp.112 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.111
	%tmp.113 = call %Main*(%Main*, %A*) %tmp.112( %Main* %tmp.107, %A* %tmp.106 )
	%tmp.114 = load %Main*, %Main** %tmp.0
	%tmp.115 = icmp eq %Main* %tmp.114, null
	br i1 %tmp.115, label %abort, label %ok.14

ok.14:
	%tmp.116 = getelementptr %Main, %Main* %tmp.114, i32 0, i32 0
	%tmp.117 = load %Main_vtable*, %Main_vtable** %tmp.116
	%tmp.118 = getelementptr %Main_vtable, %Main_vtable* %tmp.117, i32 0, i32 7
	%tmp.119 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.118
	%tmp.120 = call %Main*(%Main*, %String*) %tmp.119( %Main* %tmp.114, %String* @String.23 )
	%tmp.121 = load %Main*, %Main** %tmp.0
	%tmp.122 = icmp eq %Main* %tmp.121, null
	br i1 %tmp.122, label %abort, label %ok.15

ok.15:
	%tmp.123 = getelementptr %Main, %Main* %tmp.121, i32 0, i32 0
	%tmp.124 = load %Main_vtable*, %Main_vtable** %tmp.123
	%tmp.125 = getelementptr %Main_vtable, %Main_vtable* %tmp.124, i32 0, i32 7
	%tmp.126 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.125
	%tmp.127 = call %Main*(%Main*, %String*) %tmp.126( %Main* %tmp.121, %String* @String.24 )
	%tmp.128 = load %Main*, %Main** %tmp.0
	%tmp.129 = getelementptr %Main, %Main* %tmp.128, i32 0, i32 2
	%tmp.130 = load %A*, %A** %tmp.129
	%tmp.131 = load %Main*, %Main** %tmp.0
	%tmp.132 = icmp eq %Main* %tmp.131, null
	br i1 %tmp.132, label %abort, label %ok.16

ok.16:
	%tmp.133 = getelementptr %Main, %Main* %tmp.131, i32 0, i32 0
	%tmp.134 = load %Main_vtable*, %Main_vtable** %tmp.133
	%tmp.135 = getelementptr %Main_vtable, %Main_vtable* %tmp.134, i32 0, i32 16
	%tmp.136 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.135
	%tmp.137 = call %Main*(%Main*, %A*) %tmp.136( %Main* %tmp.131, %A* %tmp.130 )
	%tmp.138 = load %Main*, %Main** %tmp.0
	%tmp.139 = icmp eq %Main* %tmp.138, null
	br i1 %tmp.139, label %abort, label %ok.17

ok.17:
	%tmp.140 = getelementptr %Main, %Main* %tmp.138, i32 0, i32 0
	%tmp.141 = load %Main_vtable*, %Main_vtable** %tmp.140
	%tmp.142 = getelementptr %Main_vtable, %Main_vtable* %tmp.141, i32 0, i32 7
	%tmp.143 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.142
	%tmp.144 = call %Main*(%Main*, %String*) %tmp.143( %Main* %tmp.138, %String* @String.25 )
	%tmp.145 = load %Main*, %Main** %tmp.0
	%tmp.146 = icmp eq %Main* %tmp.145, null
	br i1 %tmp.146, label %abort, label %ok.18

ok.18:
	%tmp.147 = getelementptr %Main, %Main* %tmp.145, i32 0, i32 0
	%tmp.148 = load %Main_vtable*, %Main_vtable** %tmp.147
	%tmp.149 = getelementptr %Main_vtable, %Main_vtable* %tmp.148, i32 0, i32 7
	%tmp.150 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.149
	%tmp.151 = call %Main*(%Main*, %String*) %tmp.150( %Main* %tmp.145, %String* @String.26 )
	%tmp.152 = load %Main*, %Main** %tmp.0
	%tmp.153 = getelementptr %Main, %Main* %tmp.152, i32 0, i32 2
	%tmp.154 = load %A*, %A** %tmp.153
	%tmp.155 = load %Main*, %Main** %tmp.0
	%tmp.156 = icmp eq %Main* %tmp.155, null
	br i1 %tmp.156, label %abort, label %ok.19

ok.19:
	%tmp.157 = getelementptr %Main, %Main* %tmp.155, i32 0, i32 0
	%tmp.158 = load %Main_vtable*, %Main_vtable** %tmp.157
	%tmp.159 = getelementptr %Main_vtable, %Main_vtable* %tmp.158, i32 0, i32 16
	%tmp.160 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.159
	%tmp.161 = call %Main*(%Main*, %A*) %tmp.160( %Main* %tmp.155, %A* %tmp.154 )
	%tmp.162 = load %Main*, %Main** %tmp.0
	%tmp.163 = icmp eq %Main* %tmp.162, null
	br i1 %tmp.163, label %abort, label %ok.20

ok.20:
	%tmp.164 = getelementptr %Main, %Main* %tmp.162, i32 0, i32 0
	%tmp.165 = load %Main_vtable*, %Main_vtable** %tmp.164
	%tmp.166 = getelementptr %Main_vtable, %Main_vtable* %tmp.165, i32 0, i32 7
	%tmp.167 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.166
	%tmp.168 = call %Main*(%Main*, %String*) %tmp.167( %Main* %tmp.162, %String* @String.27 )
	%tmp.169 = load %Main*, %Main** %tmp.0
	%tmp.170 = icmp eq %Main* %tmp.169, null
	br i1 %tmp.170, label %abort, label %ok.21

ok.21:
	%tmp.171 = getelementptr %Main, %Main* %tmp.169, i32 0, i32 0
	%tmp.172 = load %Main_vtable*, %Main_vtable** %tmp.171
	%tmp.173 = getelementptr %Main_vtable, %Main_vtable* %tmp.172, i32 0, i32 7
	%tmp.174 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.173
	%tmp.175 = call %Main*(%Main*, %String*) %tmp.174( %Main* %tmp.169, %String* @String.28 )
	%tmp.176 = load %Main*, %Main** %tmp.0
	%tmp.177 = getelementptr %Main, %Main* %tmp.176, i32 0, i32 2
	%tmp.178 = load %A*, %A** %tmp.177
	%tmp.179 = load %Main*, %Main** %tmp.0
	%tmp.180 = icmp eq %Main* %tmp.179, null
	br i1 %tmp.180, label %abort, label %ok.22

ok.22:
	%tmp.181 = getelementptr %Main, %Main* %tmp.179, i32 0, i32 0
	%tmp.182 = load %Main_vtable*, %Main_vtable** %tmp.181
	%tmp.183 = getelementptr %Main_vtable, %Main_vtable* %tmp.182, i32 0, i32 16
	%tmp.184 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.183
	%tmp.185 = call %Main*(%Main*, %A*) %tmp.184( %Main* %tmp.179, %A* %tmp.178 )
	%tmp.186 = load %Main*, %Main** %tmp.0
	%tmp.187 = icmp eq %Main* %tmp.186, null
	br i1 %tmp.187, label %abort, label %ok.23

ok.23:
	%tmp.188 = getelementptr %Main, %Main* %tmp.186, i32 0, i32 0
	%tmp.189 = load %Main_vtable*, %Main_vtable** %tmp.188
	%tmp.190 = getelementptr %Main_vtable, %Main_vtable* %tmp.189, i32 0, i32 7
	%tmp.191 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.190
	%tmp.192 = call %Main*(%Main*, %String*) %tmp.191( %Main* %tmp.186, %String* @String.29 )
	%tmp.193 = load %Main*, %Main** %tmp.0
	%tmp.194 = icmp eq %Main* %tmp.193, null
	br i1 %tmp.194, label %abort, label %ok.24

ok.24:
	%tmp.195 = getelementptr %Main, %Main* %tmp.193, i32 0, i32 0
	%tmp.196 = load %Main_vtable*, %Main_vtable** %tmp.195
	%tmp.197 = getelementptr %Main_vtable, %Main_vtable* %tmp.196, i32 0, i32 7
	%tmp.198 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.197
	%tmp.199 = call %Main*(%Main*, %String*) %tmp.198( %Main* %tmp.193, %String* @String.30 )
	%tmp.200 = load %Main*, %Main** %tmp.0
	%tmp.201 = icmp eq %Main* %tmp.200, null
	br i1 %tmp.201, label %abort, label %ok.25

ok.25:
	%tmp.202 = getelementptr %Main, %Main* %tmp.200, i32 0, i32 0
	%tmp.203 = load %Main_vtable*, %Main_vtable** %tmp.202
	%tmp.204 = getelementptr %Main_vtable, %Main_vtable* %tmp.203, i32 0, i32 7
	%tmp.205 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.204
	%tmp.206 = call %Main*(%Main*, %String*) %tmp.205( %Main* %tmp.200, %String* @String.31 )
	%tmp.207 = load %Main*, %Main** %tmp.0
	%tmp.208 = icmp eq %Main* %tmp.207, null
	br i1 %tmp.208, label %abort, label %ok.26

ok.26:
	%tmp.209 = getelementptr %Main, %Main* %tmp.207, i32 0, i32 0
	%tmp.210 = load %Main_vtable*, %Main_vtable** %tmp.209
	%tmp.211 = getelementptr %Main_vtable, %Main_vtable* %tmp.210, i32 0, i32 9
	%tmp.212 = load %String* (%Main*) *, %String* (%Main*) ** %tmp.211
	%tmp.213 = call %String*(%Main*) %tmp.212( %Main* %tmp.207 )
	ret %String* %tmp.213

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_prompt(%Main* %self) {

entry:
	%tmp.214 = alloca %Main*
	store %Main* %self, %Main** %tmp.214
	%tmp.215 = load %Main*, %Main** %tmp.214
	%tmp.216 = icmp eq %Main* %tmp.215, null
	br i1 %tmp.216, label %abort, label %ok.27

ok.27:
	%tmp.217 = getelementptr %Main, %Main* %tmp.215, i32 0, i32 0
	%tmp.218 = load %Main_vtable*, %Main_vtable** %tmp.217
	%tmp.219 = getelementptr %Main_vtable, %Main_vtable* %tmp.218, i32 0, i32 7
	%tmp.220 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.219
	%tmp.221 = call %Main*(%Main*, %String*) %tmp.220( %Main* %tmp.215, %String* @String.32 )
	%tmp.222 = load %Main*, %Main** %tmp.214
	%tmp.223 = icmp eq %Main* %tmp.222, null
	br i1 %tmp.223, label %abort, label %ok.28

ok.28:
	%tmp.224 = getelementptr %Main, %Main* %tmp.222, i32 0, i32 0
	%tmp.225 = load %Main_vtable*, %Main_vtable** %tmp.224
	%tmp.226 = getelementptr %Main_vtable, %Main_vtable* %tmp.225, i32 0, i32 7
	%tmp.227 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.226
	%tmp.228 = call %Main*(%Main*, %String*) %tmp.227( %Main* %tmp.222, %String* @String.33 )
	%tmp.229 = load %Main*, %Main** %tmp.214
	%tmp.230 = icmp eq %Main* %tmp.229, null
	br i1 %tmp.230, label %abort, label %ok.29

ok.29:
	%tmp.231 = getelementptr %Main, %Main* %tmp.229, i32 0, i32 0
	%tmp.232 = load %Main_vtable*, %Main_vtable** %tmp.231
	%tmp.233 = getelementptr %Main_vtable, %Main_vtable* %tmp.232, i32 0, i32 9
	%tmp.234 = load %String* (%Main*) *, %String* (%Main*) ** %tmp.233
	%tmp.235 = call %String*(%Main*) %tmp.234( %Main* %tmp.229 )
	ret %String* %tmp.235

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_get_int(%Main* %self) {

entry:
	%tmp.236 = alloca %Main*
	store %Main* %self, %Main** %tmp.236
	%tmp.237 = call %A2I* @A2I_new(  )
	%tmp.238 = alloca %A2I*
	store %A2I* %tmp.237, %A2I** %tmp.238
	%tmp.239 = load %Main*, %Main** %tmp.236
	%tmp.240 = icmp eq %Main* %tmp.239, null
	br i1 %tmp.240, label %abort, label %ok.30

ok.30:
	%tmp.241 = getelementptr %Main, %Main* %tmp.239, i32 0, i32 0
	%tmp.242 = load %Main_vtable*, %Main_vtable** %tmp.241
	%tmp.243 = getelementptr %Main_vtable, %Main_vtable* %tmp.242, i32 0, i32 12
	%tmp.244 = load %String* (%Main*) *, %String* (%Main*) ** %tmp.243
	%tmp.245 = call %String*(%Main*) %tmp.244( %Main* %tmp.239 )
	%tmp.246 = alloca %String*
	store %String* %tmp.245, %String** %tmp.246
	%tmp.247 = load %String*, %String** %tmp.246
	%tmp.248 = load %A2I*, %A2I** %tmp.238
	%tmp.249 = icmp eq %A2I* %tmp.248, null
	br i1 %tmp.249, label %abort, label %ok.31

ok.31:
	%tmp.250 = getelementptr %A2I, %A2I* %tmp.248, i32 0, i32 0
	%tmp.251 = load %A2I_vtable*, %A2I_vtable** %tmp.250
	%tmp.252 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.251, i32 0, i32 9
	%tmp.253 = load i32 (%A2I*,%String*) *, i32 (%A2I*,%String*) ** %tmp.252
	%tmp.254 = call i32(%A2I*, %String*) %tmp.253( %A2I* %tmp.248, %String* %tmp.247 )
	ret i32 %tmp.254

abort:
	call void @abort(  )
	unreachable
}

define i1 @Main_is_even(%Main* %self, i32 %num) {

entry:
	%tmp.255 = alloca %Main*
	store %Main* %self, %Main** %tmp.255
	%tmp.256 = alloca i32
	store i32 %num, i32* %tmp.256
	%tmp.257 = load i32, i32* %tmp.256
	%tmp.258 = alloca i32
	store i32 %tmp.257, i32* %tmp.258
	%tmp.259 = alloca i1
	%tmp.260 = load i32, i32* %tmp.258
	%tmp.261 = icmp slt i32 %tmp.260, 0
	br i1 %tmp.261, label %true.0, label %false.0

true.0:
	%tmp.262 = load i32, i32* %tmp.258
	%tmp.263 = sub i32 0, %tmp.262
	%tmp.264 = load %Main*, %Main** %tmp.255
	%tmp.265 = icmp eq %Main* %tmp.264, null
	br i1 %tmp.265, label %abort, label %ok.32

ok.32:
	%tmp.266 = getelementptr %Main, %Main* %tmp.264, i32 0, i32 0
	%tmp.267 = load %Main_vtable*, %Main_vtable** %tmp.266
	%tmp.268 = getelementptr %Main_vtable, %Main_vtable* %tmp.267, i32 0, i32 14
	%tmp.269 = load i1 (%Main*,i32) *, i1 (%Main*,i32) ** %tmp.268
	%tmp.270 = call i1(%Main*, i32) %tmp.269( %Main* %tmp.264, i32 %tmp.263 )
	store i1 %tmp.270, i1* %tmp.259
	br label %end.0

false.0:
	%tmp.271 = alloca i1
	%tmp.272 = load i32, i32* %tmp.258
	%tmp.273 = icmp eq i32 0, %tmp.272
	br i1 %tmp.273, label %true.1, label %false.1

true.1:
	store i1 true, i1* %tmp.271
	br label %end.1

false.1:
	%tmp.274 = alloca i1
	%tmp.275 = load i32, i32* %tmp.258
	%tmp.276 = icmp eq i32 1, %tmp.275
	br i1 %tmp.276, label %true.2, label %false.2

true.2:
	store i1 false, i1* %tmp.274
	br label %end.2

false.2:
	%tmp.277 = load i32, i32* %tmp.258
	%tmp.278 = sub i32 %tmp.277, 2
	%tmp.279 = load %Main*, %Main** %tmp.255
	%tmp.280 = icmp eq %Main* %tmp.279, null
	br i1 %tmp.280, label %abort, label %ok.33

ok.33:
	%tmp.281 = getelementptr %Main, %Main* %tmp.279, i32 0, i32 0
	%tmp.282 = load %Main_vtable*, %Main_vtable** %tmp.281
	%tmp.283 = getelementptr %Main_vtable, %Main_vtable* %tmp.282, i32 0, i32 14
	%tmp.284 = load i1 (%Main*,i32) *, i1 (%Main*,i32) ** %tmp.283
	%tmp.285 = call i1(%Main*, i32) %tmp.284( %Main* %tmp.279, i32 %tmp.278 )
	store i1 %tmp.285, i1* %tmp.274
	br label %end.2

end.2:
	%tmp.286 = load i1, i1* %tmp.274
	store i1 %tmp.286, i1* %tmp.271
	br label %end.1

end.1:
	%tmp.287 = load i1, i1* %tmp.271
	store i1 %tmp.287, i1* %tmp.259
	br label %end.0

end.0:
	%tmp.288 = load i1, i1* %tmp.259
	ret i1 %tmp.288

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_class_type(%Main* %self, %A* %var) {

entry:
	%tmp.289 = alloca %Main*
	store %Main* %self, %Main** %tmp.289
	%tmp.290 = alloca %A*
	store %A* %var, %A** %tmp.290
	%tmp.291 = load %A*, %A** %tmp.290
	%tmp.292 = icmp eq %A* %tmp.291, null
	br i1 %tmp.292, label %abort, label %ok.34

ok.34:
	%tmp.293 = getelementptr %A, %A* %tmp.291, i32 0, i32 0
	%tmp.294 = load %A_vtable*, %A_vtable** %tmp.293
	%tmp.295 = getelementptr %A_vtable, %A_vtable* %tmp.294, i32 0, i32 0
	%tmp.296 = load i32, i32* %tmp.295
	br label %case.hdr.3

case.hdr.3:
	%tmp.297 = alloca %Main*
	br label %case.10.3

case.10.3:
	%vtpm.0 = icmp slt i32 %tmp.296, 10
	br i1 %vtpm.0, label %br_exit.10.3, label %src_gte_br.10.3

src_gte_br.10.3:
	%vtpm.1 = icmp sgt i32 %tmp.296, 10
	br i1 %vtpm.1, label %br_exit.10.3, label %src_lte_mc.10.3

src_lte_mc.10.3:
	%vtpm.2 = alloca %E*
	%tmp.298 = bitcast %A* %tmp.291 to %E*
	store %E* %tmp.298, %E** %vtpm.2
	%tmp.299 = load %Main*, %Main** %tmp.289
	%tmp.300 = icmp eq %Main* %tmp.299, null
	br i1 %tmp.300, label %abort, label %ok.35

ok.35:
	%tmp.301 = getelementptr %Main, %Main* %tmp.299, i32 0, i32 0
	%tmp.302 = load %Main_vtable*, %Main_vtable** %tmp.301
	%tmp.303 = getelementptr %Main_vtable, %Main_vtable* %tmp.302, i32 0, i32 7
	%tmp.304 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.303
	%tmp.305 = call %Main*(%Main*, %String*) %tmp.304( %Main* %tmp.299, %String* @String.38 )
	store %Main* %tmp.305, %Main** %tmp.297
	br label %case.exit.3

br_exit.10.3:
	br label %case.9.3

case.9.3:
	%vtpm.3 = icmp slt i32 %tmp.296, 9
	br i1 %vtpm.3, label %br_exit.9.3, label %src_gte_br.9.3

src_gte_br.9.3:
	%vtpm.4 = icmp sgt i32 %tmp.296, 10
	br i1 %vtpm.4, label %br_exit.9.3, label %src_lte_mc.9.3

src_lte_mc.9.3:
	%vtpm.5 = alloca %D*
	%tmp.306 = bitcast %A* %tmp.291 to %D*
	store %D* %tmp.306, %D** %vtpm.5
	%tmp.307 = load %Main*, %Main** %tmp.289
	%tmp.308 = icmp eq %Main* %tmp.307, null
	br i1 %tmp.308, label %abort, label %ok.36

ok.36:
	%tmp.309 = getelementptr %Main, %Main* %tmp.307, i32 0, i32 0
	%tmp.310 = load %Main_vtable*, %Main_vtable** %tmp.309
	%tmp.311 = getelementptr %Main_vtable, %Main_vtable* %tmp.310, i32 0, i32 7
	%tmp.312 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.311
	%tmp.313 = call %Main*(%Main*, %String*) %tmp.312( %Main* %tmp.307, %String* @String.37 )
	store %Main* %tmp.313, %Main** %tmp.297
	br label %case.exit.3

br_exit.9.3:
	br label %case.8.3

case.8.3:
	%vtpm.6 = icmp slt i32 %tmp.296, 8
	br i1 %vtpm.6, label %br_exit.8.3, label %src_gte_br.8.3

src_gte_br.8.3:
	%vtpm.7 = icmp sgt i32 %tmp.296, 8
	br i1 %vtpm.7, label %br_exit.8.3, label %src_lte_mc.8.3

src_lte_mc.8.3:
	%vtpm.8 = alloca %C*
	%tmp.314 = bitcast %A* %tmp.291 to %C*
	store %C* %tmp.314, %C** %vtpm.8
	%tmp.315 = load %Main*, %Main** %tmp.289
	%tmp.316 = icmp eq %Main* %tmp.315, null
	br i1 %tmp.316, label %abort, label %ok.37

ok.37:
	%tmp.317 = getelementptr %Main, %Main* %tmp.315, i32 0, i32 0
	%tmp.318 = load %Main_vtable*, %Main_vtable** %tmp.317
	%tmp.319 = getelementptr %Main_vtable, %Main_vtable* %tmp.318, i32 0, i32 7
	%tmp.320 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.319
	%tmp.321 = call %Main*(%Main*, %String*) %tmp.320( %Main* %tmp.315, %String* @String.36 )
	store %Main* %tmp.321, %Main** %tmp.297
	br label %case.exit.3

br_exit.8.3:
	br label %case.7.3

case.7.3:
	%vtpm.9 = icmp slt i32 %tmp.296, 7
	br i1 %vtpm.9, label %br_exit.7.3, label %src_gte_br.7.3

src_gte_br.7.3:
	%vtpm.10 = icmp sgt i32 %tmp.296, 10
	br i1 %vtpm.10, label %br_exit.7.3, label %src_lte_mc.7.3

src_lte_mc.7.3:
	%vtpm.11 = alloca %B*
	%tmp.322 = bitcast %A* %tmp.291 to %B*
	store %B* %tmp.322, %B** %vtpm.11
	%tmp.323 = load %Main*, %Main** %tmp.289
	%tmp.324 = icmp eq %Main* %tmp.323, null
	br i1 %tmp.324, label %abort, label %ok.38

ok.38:
	%tmp.325 = getelementptr %Main, %Main* %tmp.323, i32 0, i32 0
	%tmp.326 = load %Main_vtable*, %Main_vtable** %tmp.325
	%tmp.327 = getelementptr %Main_vtable, %Main_vtable* %tmp.326, i32 0, i32 7
	%tmp.328 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.327
	%tmp.329 = call %Main*(%Main*, %String*) %tmp.328( %Main* %tmp.323, %String* @String.35 )
	store %Main* %tmp.329, %Main** %tmp.297
	br label %case.exit.3

br_exit.7.3:
	br label %case.6.3

case.6.3:
	%vtpm.12 = icmp slt i32 %tmp.296, 6
	br i1 %vtpm.12, label %br_exit.6.3, label %src_gte_br.6.3

src_gte_br.6.3:
	%vtpm.13 = icmp sgt i32 %tmp.296, 10
	br i1 %vtpm.13, label %br_exit.6.3, label %src_lte_mc.6.3

src_lte_mc.6.3:
	%vtpm.14 = alloca %A*
	store %A* %tmp.291, %A** %vtpm.14
	%tmp.330 = load %Main*, %Main** %tmp.289
	%tmp.331 = icmp eq %Main* %tmp.330, null
	br i1 %tmp.331, label %abort, label %ok.39

ok.39:
	%tmp.332 = getelementptr %Main, %Main* %tmp.330, i32 0, i32 0
	%tmp.333 = load %Main_vtable*, %Main_vtable** %tmp.332
	%tmp.334 = getelementptr %Main_vtable, %Main_vtable* %tmp.333, i32 0, i32 7
	%tmp.335 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.334
	%tmp.336 = call %Main*(%Main*, %String*) %tmp.335( %Main* %tmp.330, %String* @String.34 )
	store %Main* %tmp.336, %Main** %tmp.297
	br label %case.exit.3

br_exit.6.3:
	br label %case.0.3

case.0.3:
	%vtpm.15 = icmp slt i32 %tmp.296, 0
	br i1 %vtpm.15, label %br_exit.0.3, label %src_gte_br.0.3

src_gte_br.0.3:
	%vtpm.16 = icmp sgt i32 %tmp.296, 11
	br i1 %vtpm.16, label %br_exit.0.3, label %src_lte_mc.0.3

src_lte_mc.0.3:
	%vtpm.17 = alloca %Object*
	%tmp.337 = bitcast %A* %tmp.291 to %Object*
	store %Object* %tmp.337, %Object** %vtpm.17
	%tmp.338 = load %Main*, %Main** %tmp.289
	%tmp.339 = icmp eq %Main* %tmp.338, null
	br i1 %tmp.339, label %abort, label %ok.40

ok.40:
	%tmp.340 = getelementptr %Main, %Main* %tmp.338, i32 0, i32 0
	%tmp.341 = load %Main_vtable*, %Main_vtable** %tmp.340
	%tmp.342 = getelementptr %Main_vtable, %Main_vtable* %tmp.341, i32 0, i32 7
	%tmp.343 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.342
	%tmp.344 = call %Main*(%Main*, %String*) %tmp.343( %Main* %tmp.338, %String* @String.39 )
	store %Main* %tmp.344, %Main** %tmp.297
	br label %case.exit.3

br_exit.0.3:
	br label %abort

case.exit.3:
	%tmp.345 = load %Main*, %Main** %tmp.297
	ret %Main* %tmp.345

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_print(%Main* %self, %A* %var) {

entry:
	%tmp.346 = alloca %Main*
	store %Main* %self, %Main** %tmp.346
	%tmp.347 = alloca %A*
	store %A* %var, %A** %tmp.347
	%tmp.348 = call %A2I* @A2I_new(  )
	%tmp.349 = alloca %A2I*
	store %A2I* %tmp.348, %A2I** %tmp.349
	%tmp.350 = load %A*, %A** %tmp.347
	%tmp.351 = icmp eq %A* %tmp.350, null
	br i1 %tmp.351, label %abort, label %ok.43

ok.43:
	%tmp.352 = getelementptr %A, %A* %tmp.350, i32 0, i32 0
	%tmp.353 = load %A_vtable*, %A_vtable** %tmp.352
	%tmp.354 = getelementptr %A_vtable, %A_vtable* %tmp.353, i32 0, i32 7
	%tmp.355 = load i32 (%A*) *, i32 (%A*) ** %tmp.354
	%tmp.356 = call i32(%A*) %tmp.355( %A* %tmp.350 )
	%tmp.357 = load %A2I*, %A2I** %tmp.349
	%tmp.358 = icmp eq %A2I* %tmp.357, null
	br i1 %tmp.358, label %abort, label %ok.42

ok.42:
	%tmp.359 = getelementptr %A2I, %A2I* %tmp.357, i32 0, i32 0
	%tmp.360 = load %A2I_vtable*, %A2I_vtable** %tmp.359
	%tmp.361 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.360, i32 0, i32 11
	%tmp.362 = load %String* (%A2I*,i32) *, %String* (%A2I*,i32) ** %tmp.361
	%tmp.363 = call %String*(%A2I*, i32) %tmp.362( %A2I* %tmp.357, i32 %tmp.356 )
	%tmp.364 = load %Main*, %Main** %tmp.346
	%tmp.365 = icmp eq %Main* %tmp.364, null
	br i1 %tmp.365, label %abort, label %ok.41

ok.41:
	%tmp.366 = getelementptr %Main, %Main* %tmp.364, i32 0, i32 0
	%tmp.367 = load %Main_vtable*, %Main_vtable** %tmp.366
	%tmp.368 = getelementptr %Main_vtable, %Main_vtable* %tmp.367, i32 0, i32 7
	%tmp.369 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.368
	%tmp.370 = call %Main*(%Main*, %String*) %tmp.369( %Main* %tmp.364, %String* %tmp.363 )
	%tmp.371 = load %Main*, %Main** %tmp.346
	%tmp.372 = icmp eq %Main* %tmp.371, null
	br i1 %tmp.372, label %abort, label %ok.44

ok.44:
	%tmp.373 = getelementptr %Main, %Main* %tmp.371, i32 0, i32 0
	%tmp.374 = load %Main_vtable*, %Main_vtable** %tmp.373
	%tmp.375 = getelementptr %Main_vtable, %Main_vtable* %tmp.374, i32 0, i32 7
	%tmp.376 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.375
	%tmp.377 = call %Main*(%Main*, %String*) %tmp.376( %Main* %tmp.371, %String* @String.40 )
	ret %Main* %tmp.377

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_main(%Main* %self) {

entry:
	%tmp.378 = alloca %Main*
	store %Main* %self, %Main** %tmp.378
	%tmp.379 = call %A* @A_new(  )
	%tmp.380 = load %Main*, %Main** %tmp.378
	%tmp.381 = getelementptr %Main, %Main* %tmp.380, i32 0, i32 2
	store %A* %tmp.379, %A** %tmp.381
	br label %loop.4

loop.4:
	%tmp.382 = load %Main*, %Main** %tmp.378
	%tmp.383 = getelementptr %Main, %Main* %tmp.382, i32 0, i32 4
	%tmp.384 = load i1, i1* %tmp.383
	br i1 %tmp.384, label %true.4, label %false.4

true.4:
	%tmp.385 = load %Main*, %Main** %tmp.378
	%tmp.386 = icmp eq %Main* %tmp.385, null
	br i1 %tmp.386, label %abort, label %ok.45

ok.45:
	%tmp.387 = getelementptr %Main, %Main* %tmp.385, i32 0, i32 0
	%tmp.388 = load %Main_vtable*, %Main_vtable** %tmp.387
	%tmp.389 = getelementptr %Main_vtable, %Main_vtable* %tmp.388, i32 0, i32 7
	%tmp.390 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.389
	%tmp.391 = call %Main*(%Main*, %String*) %tmp.390( %Main* %tmp.385, %String* @String.41 )
	%tmp.392 = load %Main*, %Main** %tmp.378
	%tmp.393 = getelementptr %Main, %Main* %tmp.392, i32 0, i32 2
	%tmp.394 = load %A*, %A** %tmp.393
	%tmp.395 = load %Main*, %Main** %tmp.378
	%tmp.396 = icmp eq %Main* %tmp.395, null
	br i1 %tmp.396, label %abort, label %ok.46

ok.46:
	%tmp.397 = getelementptr %Main, %Main* %tmp.395, i32 0, i32 0
	%tmp.398 = load %Main_vtable*, %Main_vtable** %tmp.397
	%tmp.399 = getelementptr %Main_vtable, %Main_vtable* %tmp.398, i32 0, i32 16
	%tmp.400 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.399
	%tmp.401 = call %Main*(%Main*, %A*) %tmp.400( %Main* %tmp.395, %A* %tmp.394 )
	%tmp.402 = alloca %Main*
	%tmp.403 = load %Main*, %Main** %tmp.378
	%tmp.404 = getelementptr %Main, %Main* %tmp.403, i32 0, i32 2
	%tmp.405 = load %A*, %A** %tmp.404
	%tmp.406 = icmp eq %A* %tmp.405, null
	br i1 %tmp.406, label %abort, label %ok.48

ok.48:
	%tmp.407 = getelementptr %A, %A* %tmp.405, i32 0, i32 0
	%tmp.408 = load %A_vtable*, %A_vtable** %tmp.407
	%tmp.409 = getelementptr %A_vtable, %A_vtable* %tmp.408, i32 0, i32 7
	%tmp.410 = load i32 (%A*) *, i32 (%A*) ** %tmp.409
	%tmp.411 = call i32(%A*) %tmp.410( %A* %tmp.405 )
	%tmp.412 = load %Main*, %Main** %tmp.378
	%tmp.413 = icmp eq %Main* %tmp.412, null
	br i1 %tmp.413, label %abort, label %ok.47

ok.47:
	%tmp.414 = getelementptr %Main, %Main* %tmp.412, i32 0, i32 0
	%tmp.415 = load %Main_vtable*, %Main_vtable** %tmp.414
	%tmp.416 = getelementptr %Main_vtable, %Main_vtable* %tmp.415, i32 0, i32 14
	%tmp.417 = load i1 (%Main*,i32) *, i1 (%Main*,i32) ** %tmp.416
	%tmp.418 = call i1(%Main*, i32) %tmp.417( %Main* %tmp.412, i32 %tmp.411 )
	br i1 %tmp.418, label %true.5, label %false.5

true.5:
	%tmp.419 = load %Main*, %Main** %tmp.378
	%tmp.420 = icmp eq %Main* %tmp.419, null
	br i1 %tmp.420, label %abort, label %ok.49

ok.49:
	%tmp.421 = getelementptr %Main, %Main* %tmp.419, i32 0, i32 0
	%tmp.422 = load %Main_vtable*, %Main_vtable** %tmp.421
	%tmp.423 = getelementptr %Main_vtable, %Main_vtable* %tmp.422, i32 0, i32 7
	%tmp.424 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.423
	%tmp.425 = call %Main*(%Main*, %String*) %tmp.424( %Main* %tmp.419, %String* @String.42 )
	store %Main* %tmp.425, %Main** %tmp.402
	br label %end.5

false.5:
	%tmp.426 = load %Main*, %Main** %tmp.378
	%tmp.427 = icmp eq %Main* %tmp.426, null
	br i1 %tmp.427, label %abort, label %ok.50

ok.50:
	%tmp.428 = getelementptr %Main, %Main* %tmp.426, i32 0, i32 0
	%tmp.429 = load %Main_vtable*, %Main_vtable** %tmp.428
	%tmp.430 = getelementptr %Main_vtable, %Main_vtable* %tmp.429, i32 0, i32 7
	%tmp.431 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.430
	%tmp.432 = call %Main*(%Main*, %String*) %tmp.431( %Main* %tmp.426, %String* @String.43 )
	store %Main* %tmp.432, %Main** %tmp.402
	br label %end.5

end.5:
	%tmp.433 = load %Main*, %Main** %tmp.402
	%tmp.434 = load %Main*, %Main** %tmp.378
	%tmp.435 = getelementptr %Main, %Main* %tmp.434, i32 0, i32 2
	%tmp.436 = load %A*, %A** %tmp.435
	%tmp.437 = load %Main*, %Main** %tmp.378
	%tmp.438 = icmp eq %Main* %tmp.437, null
	br i1 %tmp.438, label %abort, label %ok.51

ok.51:
	%tmp.439 = getelementptr %Main, %Main* %tmp.437, i32 0, i32 0
	%tmp.440 = load %Main_vtable*, %Main_vtable** %tmp.439
	%tmp.441 = getelementptr %Main_vtable, %Main_vtable* %tmp.440, i32 0, i32 15
	%tmp.442 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.441
	%tmp.443 = call %Main*(%Main*, %A*) %tmp.442( %Main* %tmp.437, %A* %tmp.436 )
	%tmp.444 = load %Main*, %Main** %tmp.378
	%tmp.445 = icmp eq %Main* %tmp.444, null
	br i1 %tmp.445, label %abort, label %ok.52

ok.52:
	%tmp.446 = getelementptr %Main, %Main* %tmp.444, i32 0, i32 0
	%tmp.447 = load %Main_vtable*, %Main_vtable** %tmp.446
	%tmp.448 = getelementptr %Main_vtable, %Main_vtable* %tmp.447, i32 0, i32 11
	%tmp.449 = load %String* (%Main*) *, %String* (%Main*) ** %tmp.448
	%tmp.450 = call %String*(%Main*) %tmp.449( %Main* %tmp.444 )
	%tmp.451 = load %Main*, %Main** %tmp.378
	%tmp.452 = getelementptr %Main, %Main* %tmp.451, i32 0, i32 1
	store %String* %tmp.450, %String** %tmp.452
	%tmp.453 = alloca %Object*
	%tmp.454 = load %Main*, %Main** %tmp.378
	%tmp.455 = getelementptr %Main, %Main* %tmp.454, i32 0, i32 1
	%tmp.456 = load %String*, %String** %tmp.455
	%tmp.460 = getelementptr %String, %String* %tmp.456, i32 0, i32 1
	%tmp.458 = load i8*, i8** %tmp.460
	%tmp.461 = getelementptr %String, %String* @String.44, i32 0, i32 1
	%tmp.459 = load i8*, i8** %tmp.461
	%tmp.462 = call i32(i8*, i8*) @strcmp( i8* %tmp.458, i8* %tmp.459 )
	%tmp.457 = icmp eq i32 %tmp.462, 0
	br i1 %tmp.457, label %true.6, label %false.6

true.6:
	%tmp.463 = load %Main*, %Main** %tmp.378
	%tmp.464 = icmp eq %Main* %tmp.463, null
	br i1 %tmp.464, label %abort, label %ok.54

ok.54:
	%tmp.465 = getelementptr %Main, %Main* %tmp.463, i32 0, i32 0
	%tmp.466 = load %Main_vtable*, %Main_vtable** %tmp.465
	%tmp.467 = getelementptr %Main_vtable, %Main_vtable* %tmp.466, i32 0, i32 13
	%tmp.468 = load i32 (%Main*) *, i32 (%Main*) ** %tmp.467
	%tmp.469 = call i32(%Main*) %tmp.468( %Main* %tmp.463 )
	%tmp.470 = call %A* @A_new(  )
	%tmp.471 = icmp eq %A* %tmp.470, null
	br i1 %tmp.471, label %abort, label %ok.53

ok.53:
	%tmp.472 = getelementptr %A, %A* %tmp.470, i32 0, i32 0
	%tmp.473 = load %A_vtable*, %A_vtable** %tmp.472
	%tmp.474 = getelementptr %A_vtable, %A_vtable* %tmp.473, i32 0, i32 8
	%tmp.475 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %tmp.474
	%tmp.476 = call %A*(%A*, i32) %tmp.475( %A* %tmp.470, i32 %tmp.469 )
	%tmp.477 = load %Main*, %Main** %tmp.378
	%tmp.478 = getelementptr %Main, %Main* %tmp.477, i32 0, i32 3
	store %A* %tmp.476, %A** %tmp.478
	%tmp.479 = load %Main*, %Main** %tmp.378
	%tmp.480 = getelementptr %Main, %Main* %tmp.479, i32 0, i32 2
	%tmp.481 = load %A*, %A** %tmp.480
	%tmp.482 = icmp eq %A* %tmp.481, null
	br i1 %tmp.482, label %abort, label %ok.56

ok.56:
	%tmp.483 = getelementptr %A, %A* %tmp.481, i32 0, i32 0
	%tmp.484 = load %A_vtable*, %A_vtable** %tmp.483
	%tmp.485 = getelementptr %A_vtable, %A_vtable* %tmp.484, i32 0, i32 7
	%tmp.486 = load i32 (%A*) *, i32 (%A*) ** %tmp.485
	%tmp.487 = call i32(%A*) %tmp.486( %A* %tmp.481 )
	%tmp.488 = load %Main*, %Main** %tmp.378
	%tmp.489 = getelementptr %Main, %Main* %tmp.488, i32 0, i32 3
	%tmp.490 = load %A*, %A** %tmp.489
	%tmp.491 = icmp eq %A* %tmp.490, null
	br i1 %tmp.491, label %abort, label %ok.57

ok.57:
	%tmp.492 = getelementptr %A, %A* %tmp.490, i32 0, i32 0
	%tmp.493 = load %A_vtable*, %A_vtable** %tmp.492
	%tmp.494 = getelementptr %A_vtable, %A_vtable* %tmp.493, i32 0, i32 7
	%tmp.495 = load i32 (%A*) *, i32 (%A*) ** %tmp.494
	%tmp.496 = call i32(%A*) %tmp.495( %A* %tmp.490 )
	%tmp.497 = call %B* @B_new(  )
	%tmp.498 = icmp eq %B* %tmp.497, null
	br i1 %tmp.498, label %abort, label %ok.55

ok.55:
	%tmp.499 = getelementptr %B, %B* %tmp.497, i32 0, i32 0
	%tmp.500 = load %B_vtable*, %B_vtable** %tmp.499
	%tmp.501 = getelementptr %B_vtable, %B_vtable* %tmp.500, i32 0, i32 10
	%tmp.502 = load %B* (%B*,i32,i32) *, %B* (%B*,i32,i32) ** %tmp.501
	%tmp.503 = call %B*(%B*, i32, i32) %tmp.502( %B* %tmp.497, i32 %tmp.487, i32 %tmp.496 )
	%tmp.504 = load %Main*, %Main** %tmp.378
	%tmp.505 = getelementptr %Main, %Main* %tmp.504, i32 0, i32 2
	%tmp.506 = bitcast %B* %tmp.503 to %A*
	store %A* %tmp.506, %A** %tmp.505
	%tmp.507 = bitcast %B* %tmp.503 to %Object*
	store %Object* %tmp.507, %Object** %tmp.453
	br label %end.6

false.6:
	%tmp.508 = alloca %Object*
	%tmp.509 = load %Main*, %Main** %tmp.378
	%tmp.510 = getelementptr %Main, %Main* %tmp.509, i32 0, i32 1
	%tmp.511 = load %String*, %String** %tmp.510
	%tmp.515 = getelementptr %String, %String* %tmp.511, i32 0, i32 1
	%tmp.513 = load i8*, i8** %tmp.515
	%tmp.516 = getelementptr %String, %String* @String.45, i32 0, i32 1
	%tmp.514 = load i8*, i8** %tmp.516
	%tmp.517 = call i32(i8*, i8*) @strcmp( i8* %tmp.513, i8* %tmp.514 )
	%tmp.512 = icmp eq i32 %tmp.517, 0
	br i1 %tmp.512, label %true.7, label %false.7

true.7:
	%tmp.518 = load %Main*, %Main** %tmp.378
	%tmp.519 = getelementptr %Main, %Main* %tmp.518, i32 0, i32 2
	%tmp.520 = load %A*, %A** %tmp.519
	%tmp.521 = icmp eq %A* %tmp.520, null
	br i1 %tmp.521, label %abort, label %ok.58

ok.58:
	%tmp.522 = getelementptr %A, %A* %tmp.520, i32 0, i32 0
	%tmp.523 = load %A_vtable*, %A_vtable** %tmp.522
	%tmp.524 = getelementptr %A_vtable, %A_vtable* %tmp.523, i32 0, i32 0
	%tmp.525 = load i32, i32* %tmp.524
	br label %case.hdr.8

case.hdr.8:
	%tmp.526 = alloca %A*
	br label %case.8.8

case.8.8:
	%vtpm.18 = icmp slt i32 %tmp.525, 8
	br i1 %vtpm.18, label %br_exit.8.8, label %src_gte_br.8.8

src_gte_br.8.8:
	%vtpm.19 = icmp sgt i32 %tmp.525, 8
	br i1 %vtpm.19, label %br_exit.8.8, label %src_lte_mc.8.8

src_lte_mc.8.8:
	%vtpm.20 = alloca %C*
	%tmp.527 = bitcast %A* %tmp.520 to %C*
	store %C* %tmp.527, %C** %vtpm.20
	%tmp.528 = load %C*, %C** %vtpm.20
	%tmp.529 = icmp eq %C* %tmp.528, null
	br i1 %tmp.529, label %abort, label %ok.60

ok.60:
	%tmp.530 = getelementptr %C, %C* %tmp.528, i32 0, i32 0
	%tmp.531 = load %C_vtable*, %C_vtable** %tmp.530
	%tmp.532 = getelementptr %C_vtable, %C_vtable* %tmp.531, i32 0, i32 7
	%tmp.533 = load i32 (%C*) *, i32 (%C*) ** %tmp.532
	%tmp.534 = call i32(%C*) %tmp.533( %C* %tmp.528 )
	%tmp.535 = load %C*, %C** %vtpm.20
	%tmp.536 = icmp eq %C* %tmp.535, null
	br i1 %tmp.536, label %abort, label %ok.59

ok.59:
	%tmp.537 = getelementptr %C, %C* %tmp.535, i32 0, i32 0
	%tmp.538 = load %C_vtable*, %C_vtable** %tmp.537
	%tmp.539 = getelementptr %C_vtable, %C_vtable* %tmp.538, i32 0, i32 14
	%tmp.540 = load %A* (%C*,i32) *, %A* (%C*,i32) ** %tmp.539
	%tmp.541 = call %A*(%C*, i32) %tmp.540( %C* %tmp.535, i32 %tmp.534 )
	%tmp.542 = load %Main*, %Main** %tmp.378
	%tmp.543 = getelementptr %Main, %Main* %tmp.542, i32 0, i32 2
	store %A* %tmp.541, %A** %tmp.543
	%tmp.544 = bitcast %A* %tmp.541 to %Object*
	%tmp.545 = bitcast %Object* %tmp.544 to %A*
	store %A* %tmp.545, %A** %tmp.526
	br label %case.exit.8

br_exit.8.8:
	br label %case.6.8

case.6.8:
	%vtpm.21 = icmp slt i32 %tmp.525, 6
	br i1 %vtpm.21, label %br_exit.6.8, label %src_gte_br.6.8

src_gte_br.6.8:
	%vtpm.22 = icmp sgt i32 %tmp.525, 10
	br i1 %vtpm.22, label %br_exit.6.8, label %src_lte_mc.6.8

src_lte_mc.6.8:
	%vtpm.23 = alloca %A*
	store %A* %tmp.520, %A** %vtpm.23
	%tmp.546 = load %A*, %A** %vtpm.23
	%tmp.547 = icmp eq %A* %tmp.546, null
	br i1 %tmp.547, label %abort, label %ok.62

ok.62:
	%tmp.548 = getelementptr %A, %A* %tmp.546, i32 0, i32 0
	%tmp.549 = load %A_vtable*, %A_vtable** %tmp.548
	%tmp.550 = getelementptr %A_vtable, %A_vtable* %tmp.549, i32 0, i32 7
	%tmp.551 = load i32 (%A*) *, i32 (%A*) ** %tmp.550
	%tmp.552 = call i32(%A*) %tmp.551( %A* %tmp.546 )
	%tmp.553 = load %A*, %A** %vtpm.23
	%tmp.554 = icmp eq %A* %tmp.553, null
	br i1 %tmp.554, label %abort, label %ok.61

ok.61:
	%tmp.555 = getelementptr %A, %A* %tmp.553, i32 0, i32 0
	%tmp.556 = load %A_vtable*, %A_vtable** %tmp.555
	%tmp.557 = getelementptr %A_vtable, %A_vtable* %tmp.556, i32 0, i32 11
	%tmp.558 = load %C* (%A*,i32) *, %C* (%A*,i32) ** %tmp.557
	%tmp.559 = call %C*(%A*, i32) %tmp.558( %A* %tmp.553, i32 %tmp.552 )
	%tmp.560 = load %Main*, %Main** %tmp.378
	%tmp.561 = getelementptr %Main, %Main* %tmp.560, i32 0, i32 2
	%tmp.562 = bitcast %C* %tmp.559 to %A*
	store %A* %tmp.562, %A** %tmp.561
	%tmp.563 = bitcast %C* %tmp.559 to %Object*
	%tmp.564 = bitcast %Object* %tmp.563 to %A*
	store %A* %tmp.564, %A** %tmp.526
	br label %case.exit.8

br_exit.6.8:
	br label %case.0.8

case.0.8:
	%vtpm.24 = icmp slt i32 %tmp.525, 0
	br i1 %vtpm.24, label %br_exit.0.8, label %src_gte_br.0.8

src_gte_br.0.8:
	%vtpm.25 = icmp sgt i32 %tmp.525, 11
	br i1 %vtpm.25, label %br_exit.0.8, label %src_lte_mc.0.8

src_lte_mc.0.8:
	%vtpm.26 = alloca %Object*
	%tmp.565 = bitcast %A* %tmp.520 to %Object*
	store %Object* %tmp.565, %Object** %vtpm.26
	%tmp.566 = load %Main*, %Main** %tmp.378
	%tmp.567 = icmp eq %Main* %tmp.566, null
	br i1 %tmp.567, label %abort, label %ok.63

ok.63:
	%tmp.568 = getelementptr %Main, %Main* %tmp.566, i32 0, i32 0
	%tmp.569 = load %Main_vtable*, %Main_vtable** %tmp.568
	%tmp.570 = getelementptr %Main_vtable, %Main_vtable* %tmp.569, i32 0, i32 7
	%tmp.571 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.570
	%tmp.572 = call %Main*(%Main*, %String*) %tmp.571( %Main* %tmp.566, %String* @String.39 )
	%tmp.573 = load %Main*, %Main** %tmp.378
	%tmp.574 = icmp eq %Main* %tmp.573, null
	br i1 %tmp.574, label %abort, label %ok.64

ok.64:
	%tmp.575 = getelementptr %Main, %Main* %tmp.573, i32 0, i32 0
	%tmp.576 = load %Main_vtable*, %Main_vtable** %tmp.575
	%tmp.577 = getelementptr %Main_vtable, %Main_vtable* %tmp.576, i32 0, i32 4
	%tmp.578 = load %Object* (%Main*) *, %Object* (%Main*) ** %tmp.577
	%tmp.579 = call %Object*(%Main*) %tmp.578( %Main* %tmp.573 )
	%tmp.581 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.581, i32 0 )
	%tmp.582 = bitcast %Int* %tmp.581 to %Object*
	%tmp.583 = bitcast %Object* %tmp.582 to %A*
	store %A* %tmp.583, %A** %tmp.526
	br label %case.exit.8

br_exit.0.8:
	br label %abort

case.exit.8:
	%tmp.584 = load %A*, %A** %tmp.526
	%tmp.585 = bitcast %A* %tmp.584 to %Object*
	store %Object* %tmp.585, %Object** %tmp.508
	br label %end.7

false.7:
	%tmp.586 = alloca %Object*
	%tmp.587 = load %Main*, %Main** %tmp.378
	%tmp.588 = getelementptr %Main, %Main* %tmp.587, i32 0, i32 1
	%tmp.589 = load %String*, %String** %tmp.588
	%tmp.593 = getelementptr %String, %String* %tmp.589, i32 0, i32 1
	%tmp.591 = load i8*, i8** %tmp.593
	%tmp.594 = getelementptr %String, %String* @String.46, i32 0, i32 1
	%tmp.592 = load i8*, i8** %tmp.594
	%tmp.595 = call i32(i8*, i8*) @strcmp( i8* %tmp.591, i8* %tmp.592 )
	%tmp.590 = icmp eq i32 %tmp.595, 0
	br i1 %tmp.590, label %true.9, label %false.9

true.9:
	%tmp.596 = load %Main*, %Main** %tmp.378
	%tmp.597 = icmp eq %Main* %tmp.596, null
	br i1 %tmp.597, label %abort, label %ok.66

ok.66:
	%tmp.598 = getelementptr %Main, %Main* %tmp.596, i32 0, i32 0
	%tmp.599 = load %Main_vtable*, %Main_vtable** %tmp.598
	%tmp.600 = getelementptr %Main_vtable, %Main_vtable* %tmp.599, i32 0, i32 13
	%tmp.601 = load i32 (%Main*) *, i32 (%Main*) ** %tmp.600
	%tmp.602 = call i32(%Main*) %tmp.601( %Main* %tmp.596 )
	%tmp.603 = call %A* @A_new(  )
	%tmp.604 = icmp eq %A* %tmp.603, null
	br i1 %tmp.604, label %abort, label %ok.65

ok.65:
	%tmp.605 = getelementptr %A, %A* %tmp.603, i32 0, i32 0
	%tmp.606 = load %A_vtable*, %A_vtable** %tmp.605
	%tmp.607 = getelementptr %A_vtable, %A_vtable* %tmp.606, i32 0, i32 8
	%tmp.608 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %tmp.607
	%tmp.609 = call %A*(%A*, i32) %tmp.608( %A* %tmp.603, i32 %tmp.602 )
	%tmp.610 = load %Main*, %Main** %tmp.378
	%tmp.611 = getelementptr %Main, %Main* %tmp.610, i32 0, i32 3
	store %A* %tmp.609, %A** %tmp.611
	%tmp.612 = load %Main*, %Main** %tmp.378
	%tmp.613 = getelementptr %Main, %Main* %tmp.612, i32 0, i32 2
	%tmp.614 = load %A*, %A** %tmp.613
	%tmp.615 = icmp eq %A* %tmp.614, null
	br i1 %tmp.615, label %abort, label %ok.68

ok.68:
	%tmp.616 = getelementptr %A, %A* %tmp.614, i32 0, i32 0
	%tmp.617 = load %A_vtable*, %A_vtable** %tmp.616
	%tmp.618 = getelementptr %A_vtable, %A_vtable* %tmp.617, i32 0, i32 7
	%tmp.619 = load i32 (%A*) *, i32 (%A*) ** %tmp.618
	%tmp.620 = call i32(%A*) %tmp.619( %A* %tmp.614 )
	%tmp.621 = load %Main*, %Main** %tmp.378
	%tmp.622 = getelementptr %Main, %Main* %tmp.621, i32 0, i32 3
	%tmp.623 = load %A*, %A** %tmp.622
	%tmp.624 = icmp eq %A* %tmp.623, null
	br i1 %tmp.624, label %abort, label %ok.69

ok.69:
	%tmp.625 = getelementptr %A, %A* %tmp.623, i32 0, i32 0
	%tmp.626 = load %A_vtable*, %A_vtable** %tmp.625
	%tmp.627 = getelementptr %A_vtable, %A_vtable* %tmp.626, i32 0, i32 7
	%tmp.628 = load i32 (%A*) *, i32 (%A*) ** %tmp.627
	%tmp.629 = call i32(%A*) %tmp.628( %A* %tmp.623 )
	%tmp.630 = call %D* @D_new(  )
	%tmp.631 = icmp eq %D* %tmp.630, null
	br i1 %tmp.631, label %abort, label %ok.67

ok.67:
	%tmp.632 = getelementptr %D, %D* %tmp.630, i32 0, i32 0
	%tmp.633 = load %D_vtable*, %D_vtable** %tmp.632
	%tmp.634 = getelementptr %D_vtable, %D_vtable* %tmp.633, i32 0, i32 12
	%tmp.635 = load %D* (%D*,i32,i32) *, %D* (%D*,i32,i32) ** %tmp.634
	%tmp.636 = call %D*(%D*, i32, i32) %tmp.635( %D* %tmp.630, i32 %tmp.620, i32 %tmp.629 )
	%tmp.637 = load %Main*, %Main** %tmp.378
	%tmp.638 = getelementptr %Main, %Main* %tmp.637, i32 0, i32 2
	%tmp.639 = bitcast %D* %tmp.636 to %A*
	store %A* %tmp.639, %A** %tmp.638
	%tmp.640 = bitcast %D* %tmp.636 to %Object*
	store %Object* %tmp.640, %Object** %tmp.586
	br label %end.9

false.9:
	%tmp.641 = alloca %Object*
	%tmp.642 = load %Main*, %Main** %tmp.378
	%tmp.643 = getelementptr %Main, %Main* %tmp.642, i32 0, i32 1
	%tmp.644 = load %String*, %String** %tmp.643
	%tmp.648 = getelementptr %String, %String* %tmp.644, i32 0, i32 1
	%tmp.646 = load i8*, i8** %tmp.648
	%tmp.649 = getelementptr %String, %String* @String.47, i32 0, i32 1
	%tmp.647 = load i8*, i8** %tmp.649
	%tmp.650 = call i32(i8*, i8*) @strcmp( i8* %tmp.646, i8* %tmp.647 )
	%tmp.645 = icmp eq i32 %tmp.650, 0
	br i1 %tmp.645, label %true.10, label %false.10

true.10:
	%tmp.651 = load %Main*, %Main** %tmp.378
	%tmp.652 = getelementptr %Main, %Main* %tmp.651, i32 0, i32 2
	%tmp.653 = load %A*, %A** %tmp.652
	%tmp.654 = icmp eq %A* %tmp.653, null
	br i1 %tmp.654, label %abort, label %ok.71

ok.71:
	%tmp.655 = getelementptr %A, %A* %tmp.653, i32 0, i32 0
	%tmp.656 = load %A_vtable*, %A_vtable** %tmp.655
	%tmp.657 = getelementptr %A_vtable, %A_vtable* %tmp.656, i32 0, i32 7
	%tmp.658 = load i32 (%A*) *, i32 (%A*) ** %tmp.657
	%tmp.659 = call i32(%A*) %tmp.658( %A* %tmp.653 )
	%tmp.660 = call %C* @C_new(  )
	%tmp.661 = icmp eq %C* %tmp.660, null
	br i1 %tmp.661, label %abort, label %ok.70

ok.70:
	%tmp.662 = getelementptr %A_vtable, %A_vtable* @A_vtable_prototype, i32 0, i32 13
	%tmp.663 = load %E* (%A*,i32) *, %E* (%A*,i32) ** %tmp.662
	%tmp.664 = bitcast %C* %tmp.660 to %A*
	%tmp.665 = call %E*(%A*, i32) %tmp.663( %A* %tmp.664, i32 %tmp.659 )
	%tmp.666 = load %Main*, %Main** %tmp.378
	%tmp.667 = getelementptr %Main, %Main* %tmp.666, i32 0, i32 2
	%tmp.668 = bitcast %E* %tmp.665 to %A*
	store %A* %tmp.668, %A** %tmp.667
	%tmp.669 = bitcast %E* %tmp.665 to %Object*
	store %Object* %tmp.669, %Object** %tmp.641
	br label %end.10

false.10:
	%tmp.670 = alloca %Object*
	%tmp.671 = load %Main*, %Main** %tmp.378
	%tmp.672 = getelementptr %Main, %Main* %tmp.671, i32 0, i32 1
	%tmp.673 = load %String*, %String** %tmp.672
	%tmp.677 = getelementptr %String, %String* %tmp.673, i32 0, i32 1
	%tmp.675 = load i8*, i8** %tmp.677
	%tmp.678 = getelementptr %String, %String* @String.48, i32 0, i32 1
	%tmp.676 = load i8*, i8** %tmp.678
	%tmp.679 = call i32(i8*, i8*) @strcmp( i8* %tmp.675, i8* %tmp.676 )
	%tmp.674 = icmp eq i32 %tmp.679, 0
	br i1 %tmp.674, label %true.11, label %false.11

true.11:
	%tmp.680 = load %Main*, %Main** %tmp.378
	%tmp.681 = getelementptr %Main, %Main* %tmp.680, i32 0, i32 2
	%tmp.682 = load %A*, %A** %tmp.681
	%tmp.683 = icmp eq %A* %tmp.682, null
	br i1 %tmp.683, label %abort, label %ok.73

ok.73:
	%tmp.684 = getelementptr %A, %A* %tmp.682, i32 0, i32 0
	%tmp.685 = load %A_vtable*, %A_vtable** %tmp.684
	%tmp.686 = getelementptr %A_vtable, %A_vtable* %tmp.685, i32 0, i32 7
	%tmp.687 = load i32 (%A*) *, i32 (%A*) ** %tmp.686
	%tmp.688 = call i32(%A*) %tmp.687( %A* %tmp.682 )
	%tmp.689 = call %C* @C_new(  )
	%tmp.690 = icmp eq %C* %tmp.689, null
	br i1 %tmp.690, label %abort, label %ok.72

ok.72:
	%tmp.691 = getelementptr %B_vtable, %B_vtable* @B_vtable_prototype, i32 0, i32 13
	%tmp.692 = load %E* (%B*,i32) *, %E* (%B*,i32) ** %tmp.691
	%tmp.693 = bitcast %C* %tmp.689 to %B*
	%tmp.694 = call %E*(%B*, i32) %tmp.692( %B* %tmp.693, i32 %tmp.688 )
	%tmp.695 = load %Main*, %Main** %tmp.378
	%tmp.696 = getelementptr %Main, %Main* %tmp.695, i32 0, i32 2
	%tmp.697 = bitcast %E* %tmp.694 to %A*
	store %A* %tmp.697, %A** %tmp.696
	%tmp.698 = bitcast %E* %tmp.694 to %Object*
	store %Object* %tmp.698, %Object** %tmp.670
	br label %end.11

false.11:
	%tmp.699 = alloca %Object*
	%tmp.700 = load %Main*, %Main** %tmp.378
	%tmp.701 = getelementptr %Main, %Main* %tmp.700, i32 0, i32 1
	%tmp.702 = load %String*, %String** %tmp.701
	%tmp.706 = getelementptr %String, %String* %tmp.702, i32 0, i32 1
	%tmp.704 = load i8*, i8** %tmp.706
	%tmp.707 = getelementptr %String, %String* @String.49, i32 0, i32 1
	%tmp.705 = load i8*, i8** %tmp.707
	%tmp.708 = call i32(i8*, i8*) @strcmp( i8* %tmp.704, i8* %tmp.705 )
	%tmp.703 = icmp eq i32 %tmp.708, 0
	br i1 %tmp.703, label %true.12, label %false.12

true.12:
	%tmp.709 = load %Main*, %Main** %tmp.378
	%tmp.710 = getelementptr %Main, %Main* %tmp.709, i32 0, i32 2
	%tmp.711 = load %A*, %A** %tmp.710
	%tmp.712 = icmp eq %A* %tmp.711, null
	br i1 %tmp.712, label %abort, label %ok.75

ok.75:
	%tmp.713 = getelementptr %A, %A* %tmp.711, i32 0, i32 0
	%tmp.714 = load %A_vtable*, %A_vtable** %tmp.713
	%tmp.715 = getelementptr %A_vtable, %A_vtable* %tmp.714, i32 0, i32 7
	%tmp.716 = load i32 (%A*) *, i32 (%A*) ** %tmp.715
	%tmp.717 = call i32(%A*) %tmp.716( %A* %tmp.711 )
	%tmp.718 = call %C* @C_new(  )
	%tmp.719 = icmp eq %C* %tmp.718, null
	br i1 %tmp.719, label %abort, label %ok.74

ok.74:
	%tmp.720 = getelementptr %C_vtable, %C_vtable* @C_vtable_prototype, i32 0, i32 13
	%tmp.721 = load %E* (%C*,i32) *, %E* (%C*,i32) ** %tmp.720
	%tmp.722 = call %E*(%C*, i32) %tmp.721( %C* %tmp.718, i32 %tmp.717 )
	%tmp.723 = load %Main*, %Main** %tmp.378
	%tmp.724 = getelementptr %Main, %Main* %tmp.723, i32 0, i32 2
	%tmp.725 = bitcast %E* %tmp.722 to %A*
	store %A* %tmp.725, %A** %tmp.724
	%tmp.726 = bitcast %E* %tmp.722 to %Object*
	store %Object* %tmp.726, %Object** %tmp.699
	br label %end.12

false.12:
	%tmp.727 = alloca %Object*
	%tmp.728 = load %Main*, %Main** %tmp.378
	%tmp.729 = getelementptr %Main, %Main* %tmp.728, i32 0, i32 1
	%tmp.730 = load %String*, %String** %tmp.729
	%tmp.734 = getelementptr %String, %String* %tmp.730, i32 0, i32 1
	%tmp.732 = load i8*, i8** %tmp.734
	%tmp.735 = getelementptr %String, %String* @String.50, i32 0, i32 1
	%tmp.733 = load i8*, i8** %tmp.735
	%tmp.736 = call i32(i8*, i8*) @strcmp( i8* %tmp.732, i8* %tmp.733 )
	%tmp.731 = icmp eq i32 %tmp.736, 0
	br i1 %tmp.731, label %true.13, label %false.13

true.13:
	%tmp.737 = alloca %Main*
	%tmp.738 = load %Main*, %Main** %tmp.378
	%tmp.739 = getelementptr %Main, %Main* %tmp.738, i32 0, i32 2
	%tmp.740 = load %A*, %A** %tmp.739
	%tmp.741 = icmp eq %A* %tmp.740, null
	br i1 %tmp.741, label %abort, label %ok.77

ok.77:
	%tmp.742 = getelementptr %A, %A* %tmp.740, i32 0, i32 0
	%tmp.743 = load %A_vtable*, %A_vtable** %tmp.742
	%tmp.744 = getelementptr %A_vtable, %A_vtable* %tmp.743, i32 0, i32 7
	%tmp.745 = load i32 (%A*) *, i32 (%A*) ** %tmp.744
	%tmp.746 = call i32(%A*) %tmp.745( %A* %tmp.740 )
	%tmp.747 = call %D* @D_new(  )
	%tmp.748 = icmp eq %D* %tmp.747, null
	br i1 %tmp.748, label %abort, label %ok.76

ok.76:
	%tmp.749 = getelementptr %D, %D* %tmp.747, i32 0, i32 0
	%tmp.750 = load %D_vtable*, %D_vtable** %tmp.749
	%tmp.751 = getelementptr %D_vtable, %D_vtable* %tmp.750, i32 0, i32 14
	%tmp.752 = load i1 (%D*,i32) *, i1 (%D*,i32) ** %tmp.751
	%tmp.753 = call i1(%D*, i32) %tmp.752( %D* %tmp.747, i32 %tmp.746 )
	br i1 %tmp.753, label %true.14, label %false.14

true.14:
	%tmp.754 = load %Main*, %Main** %tmp.378
	%tmp.755 = icmp eq %Main* %tmp.754, null
	br i1 %tmp.755, label %abort, label %ok.78

ok.78:
	%tmp.756 = getelementptr %Main, %Main* %tmp.754, i32 0, i32 0
	%tmp.757 = load %Main_vtable*, %Main_vtable** %tmp.756
	%tmp.758 = getelementptr %Main_vtable, %Main_vtable* %tmp.757, i32 0, i32 7
	%tmp.759 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.758
	%tmp.760 = call %Main*(%Main*, %String*) %tmp.759( %Main* %tmp.754, %String* @String.41 )
	%tmp.761 = load %Main*, %Main** %tmp.378
	%tmp.762 = getelementptr %Main, %Main* %tmp.761, i32 0, i32 2
	%tmp.763 = load %A*, %A** %tmp.762
	%tmp.764 = load %Main*, %Main** %tmp.378
	%tmp.765 = icmp eq %Main* %tmp.764, null
	br i1 %tmp.765, label %abort, label %ok.79

ok.79:
	%tmp.766 = getelementptr %Main, %Main* %tmp.764, i32 0, i32 0
	%tmp.767 = load %Main_vtable*, %Main_vtable** %tmp.766
	%tmp.768 = getelementptr %Main_vtable, %Main_vtable* %tmp.767, i32 0, i32 16
	%tmp.769 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.768
	%tmp.770 = call %Main*(%Main*, %A*) %tmp.769( %Main* %tmp.764, %A* %tmp.763 )
	%tmp.771 = load %Main*, %Main** %tmp.378
	%tmp.772 = icmp eq %Main* %tmp.771, null
	br i1 %tmp.772, label %abort, label %ok.80

ok.80:
	%tmp.773 = getelementptr %Main, %Main* %tmp.771, i32 0, i32 0
	%tmp.774 = load %Main_vtable*, %Main_vtable** %tmp.773
	%tmp.775 = getelementptr %Main_vtable, %Main_vtable* %tmp.774, i32 0, i32 7
	%tmp.776 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.775
	%tmp.777 = call %Main*(%Main*, %String*) %tmp.776( %Main* %tmp.771, %String* @String.51 )
	store %Main* %tmp.777, %Main** %tmp.737
	br label %end.14

false.14:
	%tmp.778 = load %Main*, %Main** %tmp.378
	%tmp.779 = icmp eq %Main* %tmp.778, null
	br i1 %tmp.779, label %abort, label %ok.81

ok.81:
	%tmp.780 = getelementptr %Main, %Main* %tmp.778, i32 0, i32 0
	%tmp.781 = load %Main_vtable*, %Main_vtable** %tmp.780
	%tmp.782 = getelementptr %Main_vtable, %Main_vtable* %tmp.781, i32 0, i32 7
	%tmp.783 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.782
	%tmp.784 = call %Main*(%Main*, %String*) %tmp.783( %Main* %tmp.778, %String* @String.41 )
	%tmp.785 = load %Main*, %Main** %tmp.378
	%tmp.786 = getelementptr %Main, %Main* %tmp.785, i32 0, i32 2
	%tmp.787 = load %A*, %A** %tmp.786
	%tmp.788 = load %Main*, %Main** %tmp.378
	%tmp.789 = icmp eq %Main* %tmp.788, null
	br i1 %tmp.789, label %abort, label %ok.82

ok.82:
	%tmp.790 = getelementptr %Main, %Main* %tmp.788, i32 0, i32 0
	%tmp.791 = load %Main_vtable*, %Main_vtable** %tmp.790
	%tmp.792 = getelementptr %Main_vtable, %Main_vtable* %tmp.791, i32 0, i32 16
	%tmp.793 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.792
	%tmp.794 = call %Main*(%Main*, %A*) %tmp.793( %Main* %tmp.788, %A* %tmp.787 )
	%tmp.795 = load %Main*, %Main** %tmp.378
	%tmp.796 = icmp eq %Main* %tmp.795, null
	br i1 %tmp.796, label %abort, label %ok.83

ok.83:
	%tmp.797 = getelementptr %Main, %Main* %tmp.795, i32 0, i32 0
	%tmp.798 = load %Main_vtable*, %Main_vtable** %tmp.797
	%tmp.799 = getelementptr %Main_vtable, %Main_vtable* %tmp.798, i32 0, i32 7
	%tmp.800 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.799
	%tmp.801 = call %Main*(%Main*, %String*) %tmp.800( %Main* %tmp.795, %String* @String.52 )
	store %Main* %tmp.801, %Main** %tmp.737
	br label %end.14

end.14:
	%tmp.802 = load %Main*, %Main** %tmp.737
	%tmp.803 = bitcast %Main* %tmp.802 to %Object*
	store %Object* %tmp.803, %Object** %tmp.727
	br label %end.13

false.13:
	%tmp.804 = alloca %Object*
	%tmp.805 = load %Main*, %Main** %tmp.378
	%tmp.806 = getelementptr %Main, %Main* %tmp.805, i32 0, i32 1
	%tmp.807 = load %String*, %String** %tmp.806
	%tmp.811 = getelementptr %String, %String* %tmp.807, i32 0, i32 1
	%tmp.809 = load i8*, i8** %tmp.811
	%tmp.812 = getelementptr %String, %String* @String.53, i32 0, i32 1
	%tmp.810 = load i8*, i8** %tmp.812
	%tmp.813 = call i32(i8*, i8*) @strcmp( i8* %tmp.809, i8* %tmp.810 )
	%tmp.808 = icmp eq i32 %tmp.813, 0
	br i1 %tmp.808, label %true.15, label %false.15

true.15:
	%tmp.814 = alloca %A*
	store %A* null, %A** %tmp.814
	%tmp.815 = load %Main*, %Main** %tmp.378
	%tmp.816 = getelementptr %Main, %Main* %tmp.815, i32 0, i32 2
	%tmp.817 = load %A*, %A** %tmp.816
	%tmp.818 = icmp eq %A* %tmp.817, null
	br i1 %tmp.818, label %abort, label %ok.85

ok.85:
	%tmp.819 = getelementptr %A, %A* %tmp.817, i32 0, i32 0
	%tmp.820 = load %A_vtable*, %A_vtable** %tmp.819
	%tmp.821 = getelementptr %A_vtable, %A_vtable* %tmp.820, i32 0, i32 7
	%tmp.822 = load i32 (%A*) *, i32 (%A*) ** %tmp.821
	%tmp.823 = call i32(%A*) %tmp.822( %A* %tmp.817 )
	%tmp.824 = call %E* @E_new(  )
	%tmp.825 = icmp eq %E* %tmp.824, null
	br i1 %tmp.825, label %abort, label %ok.84

ok.84:
	%tmp.826 = getelementptr %E, %E* %tmp.824, i32 0, i32 0
	%tmp.827 = load %E_vtable*, %E_vtable** %tmp.826
	%tmp.828 = getelementptr %E_vtable, %E_vtable* %tmp.827, i32 0, i32 15
	%tmp.829 = load %A* (%E*,i32) *, %A* (%E*,i32) ** %tmp.828
	%tmp.830 = call %A*(%E*, i32) %tmp.829( %E* %tmp.824, i32 %tmp.823 )
	store %A* %tmp.830, %A** %tmp.814
	%tmp.831 = load %Main*, %Main** %tmp.378
	%tmp.832 = getelementptr %Main, %Main* %tmp.831, i32 0, i32 2
	%tmp.833 = load %A*, %A** %tmp.832
	%tmp.834 = icmp eq %A* %tmp.833, null
	br i1 %tmp.834, label %abort, label %ok.86

ok.86:
	%tmp.835 = getelementptr %A, %A* %tmp.833, i32 0, i32 0
	%tmp.836 = load %A_vtable*, %A_vtable** %tmp.835
	%tmp.837 = getelementptr %A_vtable, %A_vtable* %tmp.836, i32 0, i32 7
	%tmp.838 = load i32 (%A*) *, i32 (%A*) ** %tmp.837
	%tmp.839 = call i32(%A*) %tmp.838( %A* %tmp.833 )
	%tmp.840 = load %A*, %A** %tmp.814
	%tmp.841 = icmp eq %A* %tmp.840, null
	br i1 %tmp.841, label %abort, label %ok.87

ok.87:
	%tmp.842 = getelementptr %A, %A* %tmp.840, i32 0, i32 0
	%tmp.843 = load %A_vtable*, %A_vtable** %tmp.842
	%tmp.844 = getelementptr %A_vtable, %A_vtable* %tmp.843, i32 0, i32 7
	%tmp.845 = load i32 (%A*) *, i32 (%A*) ** %tmp.844
	%tmp.846 = call i32(%A*) %tmp.845( %A* %tmp.840 )
	%tmp.847 = mul i32 %tmp.846, 8
	%tmp.848 = sub i32 %tmp.839, %tmp.847
	%tmp.849 = alloca i32
	store i32 %tmp.848, i32* %tmp.849
	%tmp.850 = load %Main*, %Main** %tmp.378
	%tmp.851 = icmp eq %Main* %tmp.850, null
	br i1 %tmp.851, label %abort, label %ok.88

ok.88:
	%tmp.852 = getelementptr %Main, %Main* %tmp.850, i32 0, i32 0
	%tmp.853 = load %Main_vtable*, %Main_vtable** %tmp.852
	%tmp.854 = getelementptr %Main_vtable, %Main_vtable* %tmp.853, i32 0, i32 7
	%tmp.855 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.854
	%tmp.856 = call %Main*(%Main*, %String*) %tmp.855( %Main* %tmp.850, %String* @String.41 )
	%tmp.857 = load %Main*, %Main** %tmp.378
	%tmp.858 = getelementptr %Main, %Main* %tmp.857, i32 0, i32 2
	%tmp.859 = load %A*, %A** %tmp.858
	%tmp.860 = load %Main*, %Main** %tmp.378
	%tmp.861 = icmp eq %Main* %tmp.860, null
	br i1 %tmp.861, label %abort, label %ok.89

ok.89:
	%tmp.862 = getelementptr %Main, %Main* %tmp.860, i32 0, i32 0
	%tmp.863 = load %Main_vtable*, %Main_vtable** %tmp.862
	%tmp.864 = getelementptr %Main_vtable, %Main_vtable* %tmp.863, i32 0, i32 16
	%tmp.865 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.864
	%tmp.866 = call %Main*(%Main*, %A*) %tmp.865( %Main* %tmp.860, %A* %tmp.859 )
	%tmp.867 = load %Main*, %Main** %tmp.378
	%tmp.868 = icmp eq %Main* %tmp.867, null
	br i1 %tmp.868, label %abort, label %ok.90

ok.90:
	%tmp.869 = getelementptr %Main, %Main* %tmp.867, i32 0, i32 0
	%tmp.870 = load %Main_vtable*, %Main_vtable** %tmp.869
	%tmp.871 = getelementptr %Main_vtable, %Main_vtable* %tmp.870, i32 0, i32 7
	%tmp.872 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.871
	%tmp.873 = call %Main*(%Main*, %String*) %tmp.872( %Main* %tmp.867, %String* @String.54 )
	%tmp.874 = load %A*, %A** %tmp.814
	%tmp.875 = load %Main*, %Main** %tmp.378
	%tmp.876 = icmp eq %Main* %tmp.875, null
	br i1 %tmp.876, label %abort, label %ok.91

ok.91:
	%tmp.877 = getelementptr %Main, %Main* %tmp.875, i32 0, i32 0
	%tmp.878 = load %Main_vtable*, %Main_vtable** %tmp.877
	%tmp.879 = getelementptr %Main_vtable, %Main_vtable* %tmp.878, i32 0, i32 16
	%tmp.880 = load %Main* (%Main*,%A*) *, %Main* (%Main*,%A*) ** %tmp.879
	%tmp.881 = call %Main*(%Main*, %A*) %tmp.880( %Main* %tmp.875, %A* %tmp.874 )
	%tmp.882 = load %Main*, %Main** %tmp.378
	%tmp.883 = icmp eq %Main* %tmp.882, null
	br i1 %tmp.883, label %abort, label %ok.92

ok.92:
	%tmp.884 = getelementptr %Main, %Main* %tmp.882, i32 0, i32 0
	%tmp.885 = load %Main_vtable*, %Main_vtable** %tmp.884
	%tmp.886 = getelementptr %Main_vtable, %Main_vtable* %tmp.885, i32 0, i32 7
	%tmp.887 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.886
	%tmp.888 = call %Main*(%Main*, %String*) %tmp.887( %Main* %tmp.882, %String* @String.55 )
	%tmp.889 = call %A2I* @A2I_new(  )
	%tmp.890 = alloca %A2I*
	store %A2I* %tmp.889, %A2I** %tmp.890
	%tmp.891 = load i32, i32* %tmp.849
	%tmp.892 = load %A2I*, %A2I** %tmp.890
	%tmp.893 = icmp eq %A2I* %tmp.892, null
	br i1 %tmp.893, label %abort, label %ok.94

ok.94:
	%tmp.894 = getelementptr %A2I, %A2I* %tmp.892, i32 0, i32 0
	%tmp.895 = load %A2I_vtable*, %A2I_vtable** %tmp.894
	%tmp.896 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.895, i32 0, i32 11
	%tmp.897 = load %String* (%A2I*,i32) *, %String* (%A2I*,i32) ** %tmp.896
	%tmp.898 = call %String*(%A2I*, i32) %tmp.897( %A2I* %tmp.892, i32 %tmp.891 )
	%tmp.899 = load %Main*, %Main** %tmp.378
	%tmp.900 = icmp eq %Main* %tmp.899, null
	br i1 %tmp.900, label %abort, label %ok.93

ok.93:
	%tmp.901 = getelementptr %Main, %Main* %tmp.899, i32 0, i32 0
	%tmp.902 = load %Main_vtable*, %Main_vtable** %tmp.901
	%tmp.903 = getelementptr %Main_vtable, %Main_vtable* %tmp.902, i32 0, i32 7
	%tmp.904 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.903
	%tmp.905 = call %Main*(%Main*, %String*) %tmp.904( %Main* %tmp.899, %String* %tmp.898 )
	%tmp.906 = load %Main*, %Main** %tmp.378
	%tmp.907 = icmp eq %Main* %tmp.906, null
	br i1 %tmp.907, label %abort, label %ok.95

ok.95:
	%tmp.908 = getelementptr %Main, %Main* %tmp.906, i32 0, i32 0
	%tmp.909 = load %Main_vtable*, %Main_vtable** %tmp.908
	%tmp.910 = getelementptr %Main_vtable, %Main_vtable* %tmp.909, i32 0, i32 7
	%tmp.911 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.910
	%tmp.912 = call %Main*(%Main*, %String*) %tmp.911( %Main* %tmp.906, %String* @String.32 )
	%tmp.913 = load %A*, %A** %tmp.814
	%tmp.914 = load %Main*, %Main** %tmp.378
	%tmp.915 = getelementptr %Main, %Main* %tmp.914, i32 0, i32 2
	store %A* %tmp.913, %A** %tmp.915
	%tmp.916 = bitcast %A* %tmp.913 to %Object*
	store %Object* %tmp.916, %Object** %tmp.804
	br label %end.15

false.15:
	%tmp.917 = alloca %Object*
	%tmp.918 = load %Main*, %Main** %tmp.378
	%tmp.919 = getelementptr %Main, %Main* %tmp.918, i32 0, i32 1
	%tmp.920 = load %String*, %String** %tmp.919
	%tmp.924 = getelementptr %String, %String* %tmp.920, i32 0, i32 1
	%tmp.922 = load i8*, i8** %tmp.924
	%tmp.925 = getelementptr %String, %String* @String.56, i32 0, i32 1
	%tmp.923 = load i8*, i8** %tmp.925
	%tmp.926 = call i32(i8*, i8*) @strcmp( i8* %tmp.922, i8* %tmp.923 )
	%tmp.921 = icmp eq i32 %tmp.926, 0
	br i1 %tmp.921, label %true.16, label %false.16

true.16:
	%tmp.927 = call %A* @A_new(  )
	%tmp.928 = load %Main*, %Main** %tmp.378
	%tmp.929 = getelementptr %Main, %Main* %tmp.928, i32 0, i32 2
	store %A* %tmp.927, %A** %tmp.929
	%tmp.930 = bitcast %A* %tmp.927 to %Object*
	store %Object* %tmp.930, %Object** %tmp.917
	br label %end.16

false.16:
	%tmp.931 = alloca %Object*
	%tmp.932 = load %Main*, %Main** %tmp.378
	%tmp.933 = getelementptr %Main, %Main* %tmp.932, i32 0, i32 1
	%tmp.934 = load %String*, %String** %tmp.933
	%tmp.938 = getelementptr %String, %String* %tmp.934, i32 0, i32 1
	%tmp.936 = load i8*, i8** %tmp.938
	%tmp.939 = getelementptr %String, %String* @String.57, i32 0, i32 1
	%tmp.937 = load i8*, i8** %tmp.939
	%tmp.940 = call i32(i8*, i8*) @strcmp( i8* %tmp.936, i8* %tmp.937 )
	%tmp.935 = icmp eq i32 %tmp.940, 0
	br i1 %tmp.935, label %true.17, label %false.17

true.17:
	%tmp.941 = load %Main*, %Main** %tmp.378
	%tmp.942 = getelementptr %Main, %Main* %tmp.941, i32 0, i32 4
	store i1 false, i1* %tmp.942
	%tmp.944 = call %Bool* @Bool_new(  )
	call void(%Bool*, i1) @Bool_init( %Bool* %tmp.944, i1 false )
	%tmp.945 = bitcast %Bool* %tmp.944 to %Object*
	store %Object* %tmp.945, %Object** %tmp.931
	br label %end.17

false.17:
	%tmp.946 = load %Main*, %Main** %tmp.378
	%tmp.947 = getelementptr %Main, %Main* %tmp.946, i32 0, i32 2
	%tmp.948 = load %A*, %A** %tmp.947
	%tmp.949 = icmp eq %A* %tmp.948, null
	br i1 %tmp.949, label %abort, label %ok.97

ok.97:
	%tmp.950 = getelementptr %A, %A* %tmp.948, i32 0, i32 0
	%tmp.951 = load %A_vtable*, %A_vtable** %tmp.950
	%tmp.952 = getelementptr %A_vtable, %A_vtable* %tmp.951, i32 0, i32 7
	%tmp.953 = load i32 (%A*) *, i32 (%A*) ** %tmp.952
	%tmp.954 = call i32(%A*) %tmp.953( %A* %tmp.948 )
	%tmp.955 = call %A* @A_new(  )
	%tmp.956 = icmp eq %A* %tmp.955, null
	br i1 %tmp.956, label %abort, label %ok.96

ok.96:
	%tmp.957 = getelementptr %A, %A* %tmp.955, i32 0, i32 0
	%tmp.958 = load %A_vtable*, %A_vtable** %tmp.957
	%tmp.959 = getelementptr %A_vtable, %A_vtable* %tmp.958, i32 0, i32 9
	%tmp.960 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %tmp.959
	%tmp.961 = call %A*(%A*, i32) %tmp.960( %A* %tmp.955, i32 %tmp.954 )
	%tmp.962 = load %Main*, %Main** %tmp.378
	%tmp.963 = getelementptr %Main, %Main* %tmp.962, i32 0, i32 2
	store %A* %tmp.961, %A** %tmp.963
	%tmp.964 = bitcast %A* %tmp.961 to %Object*
	store %Object* %tmp.964, %Object** %tmp.931
	br label %end.17

end.17:
	%tmp.965 = load %Object*, %Object** %tmp.931
	store %Object* %tmp.965, %Object** %tmp.917
	br label %end.16

end.16:
	%tmp.966 = load %Object*, %Object** %tmp.917
	store %Object* %tmp.966, %Object** %tmp.804
	br label %end.15

end.15:
	%tmp.967 = load %Object*, %Object** %tmp.804
	store %Object* %tmp.967, %Object** %tmp.727
	br label %end.13

end.13:
	%tmp.968 = load %Object*, %Object** %tmp.727
	store %Object* %tmp.968, %Object** %tmp.699
	br label %end.12

end.12:
	%tmp.969 = load %Object*, %Object** %tmp.699
	store %Object* %tmp.969, %Object** %tmp.670
	br label %end.11

end.11:
	%tmp.970 = load %Object*, %Object** %tmp.670
	store %Object* %tmp.970, %Object** %tmp.641
	br label %end.10

end.10:
	%tmp.971 = load %Object*, %Object** %tmp.641
	store %Object* %tmp.971, %Object** %tmp.586
	br label %end.9

end.9:
	%tmp.972 = load %Object*, %Object** %tmp.586
	store %Object* %tmp.972, %Object** %tmp.508
	br label %end.7

end.7:
	%tmp.973 = load %Object*, %Object** %tmp.508
	store %Object* %tmp.973, %Object** %tmp.453
	br label %end.6

end.6:
	%tmp.974 = load %Object*, %Object** %tmp.453
	br label %loop.4

false.4:
	ret %Object* null

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.975 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.976 = load i32, i32* %tmp.975
	%tmp.977 = call i8*(i32) @malloc( i32 %tmp.976 )
	%tmp.978 = bitcast i8* %tmp.977 to %Main*
	%tmp.979 = getelementptr %Main, %Main* %tmp.978, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.979
	%tmp.980 = alloca %Main*
	store %Main* %tmp.978, %Main** %tmp.980
	%tmp.981 = getelementptr %Main, %Main* %tmp.978, i32 0, i32 1
	%tmp.982 = call %String* @String_new(  )
	store %String* %tmp.982, %String** %tmp.981
	%tmp.983 = getelementptr %Main, %Main* %tmp.978, i32 0, i32 2
	store %A* null, %A** %tmp.983
	%tmp.984 = getelementptr %Main, %Main* %tmp.978, i32 0, i32 3
	store %A* null, %A** %tmp.984
	%tmp.985 = getelementptr %Main, %Main* %tmp.978, i32 0, i32 4
	store i1 true, i1* %tmp.985
	ret %Main* %tmp.978

abort:
	call void @abort(  )
	unreachable
}

define i32 @A_value(%A* %self) {

entry:
	%tmp.0 = alloca %A*
	store %A* %self, %A** %tmp.0
	%tmp.1 = load %A*, %A** %tmp.0
	%tmp.2 = getelementptr %A, %A* %tmp.1, i32 0, i32 1
	%tmp.3 = load i32, i32* %tmp.2
	ret i32 %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_set_var(%A* %self, i32 %num) {

entry:
	%tmp.4 = alloca %A*
	store %A* %self, %A** %tmp.4
	%tmp.5 = alloca i32
	store i32 %num, i32* %tmp.5
	%tmp.6 = load i32, i32* %tmp.5
	%tmp.7 = load %A*, %A** %tmp.4
	%tmp.8 = getelementptr %A, %A* %tmp.7, i32 0, i32 1
	store i32 %tmp.6, i32* %tmp.8
	%tmp.9 = load %A*, %A** %tmp.4
	ret %A* %tmp.9

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_method1(%A* %self, i32 %num) {

entry:
	%tmp.10 = alloca %A*
	store %A* %self, %A** %tmp.10
	%tmp.11 = alloca i32
	store i32 %num, i32* %tmp.11
	%tmp.12 = load %A*, %A** %tmp.10
	ret %A* %tmp.12

abort:
	call void @abort(  )
	unreachable
}

define %B* @A_method2(%A* %self, i32 %num1, i32 %num2) {

entry:
	%tmp.13 = alloca %A*
	store %A* %self, %A** %tmp.13
	%tmp.14 = alloca i32
	store i32 %num1, i32* %tmp.14
	%tmp.15 = alloca i32
	store i32 %num2, i32* %tmp.15
	%tmp.16 = alloca i32
	store i32 0, i32* %tmp.16
	%tmp.17 = load i32, i32* %tmp.14
	%tmp.18 = load i32, i32* %tmp.15
	%tmp.19 = add i32 %tmp.17, %tmp.18
	store i32 %tmp.19, i32* %tmp.16
	%tmp.20 = load i32, i32* %tmp.16
	%tmp.21 = call %B* @B_new(  )
	%tmp.22 = icmp eq %B* %tmp.21, null
	br i1 %tmp.22, label %abort, label %ok.0

ok.0:
	%tmp.23 = getelementptr %B, %B* %tmp.21, i32 0, i32 0
	%tmp.24 = load %B_vtable*, %B_vtable** %tmp.23
	%tmp.25 = getelementptr %B_vtable, %B_vtable* %tmp.24, i32 0, i32 8
	%tmp.26 = load %B* (%B*,i32) *, %B* (%B*,i32) ** %tmp.25
	%tmp.27 = call %B*(%B*, i32) %tmp.26( %B* %tmp.21, i32 %tmp.20 )
	ret %B* %tmp.27

abort:
	call void @abort(  )
	unreachable
}

define %C* @A_method3(%A* %self, i32 %num) {

entry:
	%tmp.28 = alloca %A*
	store %A* %self, %A** %tmp.28
	%tmp.29 = alloca i32
	store i32 %num, i32* %tmp.29
	%tmp.30 = alloca i32
	store i32 0, i32* %tmp.30
	%tmp.31 = load i32, i32* %tmp.29
	%tmp.32 = sub i32 0, %tmp.31
	store i32 %tmp.32, i32* %tmp.30
	%tmp.33 = load i32, i32* %tmp.30
	%tmp.34 = call %C* @C_new(  )
	%tmp.35 = icmp eq %C* %tmp.34, null
	br i1 %tmp.35, label %abort, label %ok.1

ok.1:
	%tmp.36 = getelementptr %C, %C* %tmp.34, i32 0, i32 0
	%tmp.37 = load %C_vtable*, %C_vtable** %tmp.36
	%tmp.38 = getelementptr %C_vtable, %C_vtable* %tmp.37, i32 0, i32 8
	%tmp.39 = load %C* (%C*,i32) *, %C* (%C*,i32) ** %tmp.38
	%tmp.40 = call %C*(%C*, i32) %tmp.39( %C* %tmp.34, i32 %tmp.33 )
	ret %C* %tmp.40

abort:
	call void @abort(  )
	unreachable
}

define %D* @A_method4(%A* %self, i32 %num1, i32 %num2) {

entry:
	%tmp.41 = alloca %A*
	store %A* %self, %A** %tmp.41
	%tmp.42 = alloca i32
	store i32 %num1, i32* %tmp.42
	%tmp.43 = alloca i32
	store i32 %num2, i32* %tmp.43
	%tmp.44 = alloca %D*
	%tmp.45 = load i32, i32* %tmp.43
	%tmp.46 = load i32, i32* %tmp.42
	%tmp.47 = icmp slt i32 %tmp.45, %tmp.46
	br i1 %tmp.47, label %true.0, label %false.0

true.0:
	%tmp.48 = alloca i32
	store i32 0, i32* %tmp.48
	%tmp.49 = load i32, i32* %tmp.42
	%tmp.50 = load i32, i32* %tmp.43
	%tmp.51 = sub i32 %tmp.49, %tmp.50
	store i32 %tmp.51, i32* %tmp.48
	%tmp.52 = load i32, i32* %tmp.48
	%tmp.53 = call %D* @D_new(  )
	%tmp.54 = icmp eq %D* %tmp.53, null
	br i1 %tmp.54, label %abort, label %ok.2

ok.2:
	%tmp.55 = getelementptr %D, %D* %tmp.53, i32 0, i32 0
	%tmp.56 = load %D_vtable*, %D_vtable** %tmp.55
	%tmp.57 = getelementptr %D_vtable, %D_vtable* %tmp.56, i32 0, i32 8
	%tmp.58 = load %D* (%D*,i32) *, %D* (%D*,i32) ** %tmp.57
	%tmp.59 = call %D*(%D*, i32) %tmp.58( %D* %tmp.53, i32 %tmp.52 )
	store %D* %tmp.59, %D** %tmp.44
	br label %end.0

false.0:
	%tmp.60 = alloca i32
	store i32 0, i32* %tmp.60
	%tmp.61 = load i32, i32* %tmp.43
	%tmp.62 = load i32, i32* %tmp.42
	%tmp.63 = sub i32 %tmp.61, %tmp.62
	store i32 %tmp.63, i32* %tmp.60
	%tmp.64 = load i32, i32* %tmp.60
	%tmp.65 = call %D* @D_new(  )
	%tmp.66 = icmp eq %D* %tmp.65, null
	br i1 %tmp.66, label %abort, label %ok.3

ok.3:
	%tmp.67 = getelementptr %D, %D* %tmp.65, i32 0, i32 0
	%tmp.68 = load %D_vtable*, %D_vtable** %tmp.67
	%tmp.69 = getelementptr %D_vtable, %D_vtable* %tmp.68, i32 0, i32 8
	%tmp.70 = load %D* (%D*,i32) *, %D* (%D*,i32) ** %tmp.69
	%tmp.71 = call %D*(%D*, i32) %tmp.70( %D* %tmp.65, i32 %tmp.64 )
	store %D* %tmp.71, %D** %tmp.44
	br label %end.0

end.0:
	%tmp.72 = load %D*, %D** %tmp.44
	ret %D* %tmp.72

abort:
	call void @abort(  )
	unreachable
}

define %E* @A_method5(%A* %self, i32 %num) {

entry:
	%tmp.73 = alloca %A*
	store %A* %self, %A** %tmp.73
	%tmp.74 = alloca i32
	store i32 %num, i32* %tmp.74
	%tmp.75 = alloca i32
	store i32 1, i32* %tmp.75
	%tmp.76 = alloca i32
	store i32 1, i32* %tmp.76
	br label %loop.1

loop.1:
	%tmp.77 = load i32, i32* %tmp.76
	%tmp.78 = load i32, i32* %tmp.74
	%tmp.79 = icmp sle i32 %tmp.77, %tmp.78
	br i1 %tmp.79, label %true.1, label %false.1

true.1:
	%tmp.80 = load i32, i32* %tmp.75
	%tmp.81 = load i32, i32* %tmp.76
	%tmp.82 = mul i32 %tmp.80, %tmp.81
	store i32 %tmp.82, i32* %tmp.75
	%tmp.83 = load i32, i32* %tmp.76
	%tmp.84 = add i32 %tmp.83, 1
	store i32 %tmp.84, i32* %tmp.76
	br label %loop.1

false.1:
	%tmp.85 = load i32, i32* %tmp.75
	%tmp.86 = call %E* @E_new(  )
	%tmp.87 = icmp eq %E* %tmp.86, null
	br i1 %tmp.87, label %abort, label %ok.4

ok.4:
	%tmp.88 = getelementptr %E, %E* %tmp.86, i32 0, i32 0
	%tmp.89 = load %E_vtable*, %E_vtable** %tmp.88
	%tmp.90 = getelementptr %E_vtable, %E_vtable* %tmp.89, i32 0, i32 8
	%tmp.91 = load %E* (%E*,i32) *, %E* (%E*,i32) ** %tmp.90
	%tmp.92 = call %E*(%E*, i32) %tmp.91( %E* %tmp.86, i32 %tmp.85 )
	ret %E* %tmp.92

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%tmp.93 = getelementptr %A_vtable, %A_vtable* @A_vtable_prototype, i32 0, i32 1
	%tmp.94 = load i32, i32* %tmp.93
	%tmp.95 = call i8*(i32) @malloc( i32 %tmp.94 )
	%tmp.96 = bitcast i8* %tmp.95 to %A*
	%tmp.97 = getelementptr %A, %A* %tmp.96, i32 0, i32 0
	store %A_vtable* @A_vtable_prototype, %A_vtable** %tmp.97
	%tmp.98 = alloca %A*
	store %A* %tmp.96, %A** %tmp.98
	%tmp.99 = getelementptr %A, %A* %tmp.96, i32 0, i32 1
	store i32 0, i32* %tmp.99
	ret %A* %tmp.96

abort:
	call void @abort(  )
	unreachable
}

define %E* @B_method5(%B* %self, i32 %num) {

entry:
	%tmp.0 = alloca %B*
	store %B* %self, %B** %tmp.0
	%tmp.1 = alloca i32
	store i32 %num, i32* %tmp.1
	%tmp.2 = alloca i32
	store i32 0, i32* %tmp.2
	%tmp.3 = load i32, i32* %tmp.1
	%tmp.4 = load i32, i32* %tmp.1
	%tmp.5 = mul i32 %tmp.3, %tmp.4
	store i32 %tmp.5, i32* %tmp.2
	%tmp.6 = load i32, i32* %tmp.2
	%tmp.7 = call %E* @E_new(  )
	%tmp.8 = icmp eq %E* %tmp.7, null
	br i1 %tmp.8, label %abort, label %ok.0

ok.0:
	%tmp.9 = getelementptr %E, %E* %tmp.7, i32 0, i32 0
	%tmp.10 = load %E_vtable*, %E_vtable** %tmp.9
	%tmp.11 = getelementptr %E_vtable, %E_vtable* %tmp.10, i32 0, i32 8
	%tmp.12 = load %E* (%E*,i32) *, %E* (%E*,i32) ** %tmp.11
	%tmp.13 = call %E*(%E*, i32) %tmp.12( %E* %tmp.7, i32 %tmp.6 )
	ret %E* %tmp.13

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%tmp.14 = getelementptr %B_vtable, %B_vtable* @B_vtable_prototype, i32 0, i32 1
	%tmp.15 = load i32, i32* %tmp.14
	%tmp.16 = call i8*(i32) @malloc( i32 %tmp.15 )
	%tmp.17 = bitcast i8* %tmp.16 to %B*
	%tmp.18 = getelementptr %B, %B* %tmp.17, i32 0, i32 0
	store %B_vtable* @B_vtable_prototype, %B_vtable** %tmp.18
	%tmp.19 = alloca %B*
	store %B* %tmp.17, %B** %tmp.19
	%tmp.20 = getelementptr %B, %B* %tmp.17, i32 0, i32 1
	store i32 0, i32* %tmp.20
	ret %B* %tmp.17

abort:
	call void @abort(  )
	unreachable
}

define %A* @C_method6(%C* %self, i32 %num) {

entry:
	%tmp.0 = alloca %C*
	store %C* %self, %C** %tmp.0
	%tmp.1 = alloca i32
	store i32 %num, i32* %tmp.1
	%tmp.2 = alloca i32
	store i32 0, i32* %tmp.2
	%tmp.3 = load i32, i32* %tmp.1
	%tmp.4 = sub i32 0, %tmp.3
	store i32 %tmp.4, i32* %tmp.2
	%tmp.5 = load i32, i32* %tmp.2
	%tmp.6 = call %A* @A_new(  )
	%tmp.7 = icmp eq %A* %tmp.6, null
	br i1 %tmp.7, label %abort, label %ok.0

ok.0:
	%tmp.8 = getelementptr %A, %A* %tmp.6, i32 0, i32 0
	%tmp.9 = load %A_vtable*, %A_vtable** %tmp.8
	%tmp.10 = getelementptr %A_vtable, %A_vtable* %tmp.9, i32 0, i32 8
	%tmp.11 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %tmp.10
	%tmp.12 = call %A*(%A*, i32) %tmp.11( %A* %tmp.6, i32 %tmp.5 )
	ret %A* %tmp.12

abort:
	call void @abort(  )
	unreachable
}

define %E* @C_method5(%C* %self, i32 %num) {

entry:
	%tmp.13 = alloca %C*
	store %C* %self, %C** %tmp.13
	%tmp.14 = alloca i32
	store i32 %num, i32* %tmp.14
	%tmp.15 = alloca i32
	store i32 0, i32* %tmp.15
	%tmp.16 = load i32, i32* %tmp.14
	%tmp.17 = load i32, i32* %tmp.14
	%tmp.18 = mul i32 %tmp.16, %tmp.17
	%tmp.19 = load i32, i32* %tmp.14
	%tmp.20 = mul i32 %tmp.18, %tmp.19
	store i32 %tmp.20, i32* %tmp.15
	%tmp.21 = load i32, i32* %tmp.15
	%tmp.22 = call %E* @E_new(  )
	%tmp.23 = icmp eq %E* %tmp.22, null
	br i1 %tmp.23, label %abort, label %ok.1

ok.1:
	%tmp.24 = getelementptr %E, %E* %tmp.22, i32 0, i32 0
	%tmp.25 = load %E_vtable*, %E_vtable** %tmp.24
	%tmp.26 = getelementptr %E_vtable, %E_vtable* %tmp.25, i32 0, i32 8
	%tmp.27 = load %E* (%E*,i32) *, %E* (%E*,i32) ** %tmp.26
	%tmp.28 = call %E*(%E*, i32) %tmp.27( %E* %tmp.22, i32 %tmp.21 )
	ret %E* %tmp.28

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%tmp.29 = getelementptr %C_vtable, %C_vtable* @C_vtable_prototype, i32 0, i32 1
	%tmp.30 = load i32, i32* %tmp.29
	%tmp.31 = call i8*(i32) @malloc( i32 %tmp.30 )
	%tmp.32 = bitcast i8* %tmp.31 to %C*
	%tmp.33 = getelementptr %C, %C* %tmp.32, i32 0, i32 0
	store %C_vtable* @C_vtable_prototype, %C_vtable** %tmp.33
	%tmp.34 = alloca %C*
	store %C* %tmp.32, %C** %tmp.34
	%tmp.35 = getelementptr %C, %C* %tmp.32, i32 0, i32 1
	store i32 0, i32* %tmp.35
	ret %C* %tmp.32

abort:
	call void @abort(  )
	unreachable
}

define i1 @D_method7(%D* %self, i32 %num) {

entry:
	%tmp.0 = alloca %D*
	store %D* %self, %D** %tmp.0
	%tmp.1 = alloca i32
	store i32 %num, i32* %tmp.1
	%tmp.2 = load i32, i32* %tmp.1
	%tmp.3 = alloca i32
	store i32 %tmp.2, i32* %tmp.3
	%tmp.4 = alloca i1
	%tmp.5 = load i32, i32* %tmp.3
	%tmp.6 = icmp slt i32 %tmp.5, 0
	br i1 %tmp.6, label %true.0, label %false.0

true.0:
	%tmp.7 = load i32, i32* %tmp.3
	%tmp.8 = sub i32 0, %tmp.7
	%tmp.9 = load %D*, %D** %tmp.0
	%tmp.10 = icmp eq %D* %tmp.9, null
	br i1 %tmp.10, label %abort, label %ok.0

ok.0:
	%tmp.11 = getelementptr %D, %D* %tmp.9, i32 0, i32 0
	%tmp.12 = load %D_vtable*, %D_vtable** %tmp.11
	%tmp.13 = getelementptr %D_vtable, %D_vtable* %tmp.12, i32 0, i32 14
	%tmp.14 = load i1 (%D*,i32) *, i1 (%D*,i32) ** %tmp.13
	%tmp.15 = call i1(%D*, i32) %tmp.14( %D* %tmp.9, i32 %tmp.8 )
	store i1 %tmp.15, i1* %tmp.4
	br label %end.0

false.0:
	%tmp.16 = alloca i1
	%tmp.17 = load i32, i32* %tmp.3
	%tmp.18 = icmp eq i32 0, %tmp.17
	br i1 %tmp.18, label %true.1, label %false.1

true.1:
	store i1 true, i1* %tmp.16
	br label %end.1

false.1:
	%tmp.19 = alloca i1
	%tmp.20 = load i32, i32* %tmp.3
	%tmp.21 = icmp eq i32 1, %tmp.20
	br i1 %tmp.21, label %true.2, label %false.2

true.2:
	store i1 false, i1* %tmp.19
	br label %end.2

false.2:
	%tmp.22 = alloca i1
	%tmp.23 = load i32, i32* %tmp.3
	%tmp.24 = icmp eq i32 2, %tmp.23
	br i1 %tmp.24, label %true.3, label %false.3

true.3:
	store i1 false, i1* %tmp.22
	br label %end.3

false.3:
	%tmp.25 = load i32, i32* %tmp.3
	%tmp.26 = sub i32 %tmp.25, 3
	%tmp.27 = load %D*, %D** %tmp.0
	%tmp.28 = icmp eq %D* %tmp.27, null
	br i1 %tmp.28, label %abort, label %ok.1

ok.1:
	%tmp.29 = getelementptr %D, %D* %tmp.27, i32 0, i32 0
	%tmp.30 = load %D_vtable*, %D_vtable** %tmp.29
	%tmp.31 = getelementptr %D_vtable, %D_vtable* %tmp.30, i32 0, i32 14
	%tmp.32 = load i1 (%D*,i32) *, i1 (%D*,i32) ** %tmp.31
	%tmp.33 = call i1(%D*, i32) %tmp.32( %D* %tmp.27, i32 %tmp.26 )
	store i1 %tmp.33, i1* %tmp.22
	br label %end.3

end.3:
	%tmp.34 = load i1, i1* %tmp.22
	store i1 %tmp.34, i1* %tmp.19
	br label %end.2

end.2:
	%tmp.35 = load i1, i1* %tmp.19
	store i1 %tmp.35, i1* %tmp.16
	br label %end.1

end.1:
	%tmp.36 = load i1, i1* %tmp.16
	store i1 %tmp.36, i1* %tmp.4
	br label %end.0

end.0:
	%tmp.37 = load i1, i1* %tmp.4
	ret i1 %tmp.37

abort:
	call void @abort(  )
	unreachable
}

define %D* @D_new() {

entry:
	%tmp.38 = getelementptr %D_vtable, %D_vtable* @D_vtable_prototype, i32 0, i32 1
	%tmp.39 = load i32, i32* %tmp.38
	%tmp.40 = call i8*(i32) @malloc( i32 %tmp.39 )
	%tmp.41 = bitcast i8* %tmp.40 to %D*
	%tmp.42 = getelementptr %D, %D* %tmp.41, i32 0, i32 0
	store %D_vtable* @D_vtable_prototype, %D_vtable** %tmp.42
	%tmp.43 = alloca %D*
	store %D* %tmp.41, %D** %tmp.43
	%tmp.44 = getelementptr %D, %D* %tmp.41, i32 0, i32 1
	store i32 0, i32* %tmp.44
	ret %D* %tmp.41

abort:
	call void @abort(  )
	unreachable
}

define %A* @E_method6(%E* %self, i32 %num) {

entry:
	%tmp.0 = alloca %E*
	store %E* %self, %E** %tmp.0
	%tmp.1 = alloca i32
	store i32 %num, i32* %tmp.1
	%tmp.2 = alloca i32
	store i32 0, i32* %tmp.2
	%tmp.3 = load i32, i32* %tmp.1
	%tmp.4 = icmp eq i32 8, 0
	br i1 %tmp.4, label %abort, label %ok.0

ok.0:
	%tmp.5 = sdiv i32 %tmp.3, 8
	store i32 %tmp.5, i32* %tmp.2
	%tmp.6 = load i32, i32* %tmp.2
	%tmp.7 = call %A* @A_new(  )
	%tmp.8 = icmp eq %A* %tmp.7, null
	br i1 %tmp.8, label %abort, label %ok.1

ok.1:
	%tmp.9 = getelementptr %A, %A* %tmp.7, i32 0, i32 0
	%tmp.10 = load %A_vtable*, %A_vtable** %tmp.9
	%tmp.11 = getelementptr %A_vtable, %A_vtable* %tmp.10, i32 0, i32 8
	%tmp.12 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %tmp.11
	%tmp.13 = call %A*(%A*, i32) %tmp.12( %A* %tmp.7, i32 %tmp.6 )
	ret %A* %tmp.13

abort:
	call void @abort(  )
	unreachable
}

define %E* @E_new() {

entry:
	%tmp.14 = getelementptr %E_vtable, %E_vtable* @E_vtable_prototype, i32 0, i32 1
	%tmp.15 = load i32, i32* %tmp.14
	%tmp.16 = call i8*(i32) @malloc( i32 %tmp.15 )
	%tmp.17 = bitcast i8* %tmp.16 to %E*
	%tmp.18 = getelementptr %E, %E* %tmp.17, i32 0, i32 0
	store %E_vtable* @E_vtable_prototype, %E_vtable** %tmp.18
	%tmp.19 = alloca %E*
	store %E* %tmp.17, %E** %tmp.19
	%tmp.20 = getelementptr %E, %E* %tmp.17, i32 0, i32 1
	store i32 0, i32* %tmp.20
	ret %E* %tmp.17

abort:
	call void @abort(  )
	unreachable
}

define i32 @A2I_c2i(%A2I* %self, %String* %char) {

entry:
	%tmp.0 = alloca %A2I*
	store %A2I* %self, %A2I** %tmp.0
	%tmp.1 = alloca %String*
	store %String* %char, %String** %tmp.1
	%tmp.2 = alloca i32
	%tmp.3 = load %String*, %String** %tmp.1
	%tmp.7 = getelementptr %String, %String* %tmp.3, i32 0, i32 1
	%tmp.5 = load i8*, i8** %tmp.7
	%tmp.8 = getelementptr %String, %String* @String.1, i32 0, i32 1
	%tmp.6 = load i8*, i8** %tmp.8
	%tmp.9 = call i32(i8*, i8*) @strcmp( i8* %tmp.5, i8* %tmp.6 )
	%tmp.4 = icmp eq i32 %tmp.9, 0
	br i1 %tmp.4, label %true.0, label %false.0

true.0:
	store i32 0, i32* %tmp.2
	br label %end.0

false.0:
	%tmp.10 = alloca i32
	%tmp.11 = load %String*, %String** %tmp.1
	%tmp.15 = getelementptr %String, %String* %tmp.11, i32 0, i32 1
	%tmp.13 = load i8*, i8** %tmp.15
	%tmp.16 = getelementptr %String, %String* @String.2, i32 0, i32 1
	%tmp.14 = load i8*, i8** %tmp.16
	%tmp.17 = call i32(i8*, i8*) @strcmp( i8* %tmp.13, i8* %tmp.14 )
	%tmp.12 = icmp eq i32 %tmp.17, 0
	br i1 %tmp.12, label %true.1, label %false.1

true.1:
	store i32 1, i32* %tmp.10
	br label %end.1

false.1:
	%tmp.18 = alloca i32
	%tmp.19 = load %String*, %String** %tmp.1
	%tmp.23 = getelementptr %String, %String* %tmp.19, i32 0, i32 1
	%tmp.21 = load i8*, i8** %tmp.23
	%tmp.24 = getelementptr %String, %String* @String.3, i32 0, i32 1
	%tmp.22 = load i8*, i8** %tmp.24
	%tmp.25 = call i32(i8*, i8*) @strcmp( i8* %tmp.21, i8* %tmp.22 )
	%tmp.20 = icmp eq i32 %tmp.25, 0
	br i1 %tmp.20, label %true.2, label %false.2

true.2:
	store i32 2, i32* %tmp.18
	br label %end.2

false.2:
	%tmp.26 = alloca i32
	%tmp.27 = load %String*, %String** %tmp.1
	%tmp.31 = getelementptr %String, %String* %tmp.27, i32 0, i32 1
	%tmp.29 = load i8*, i8** %tmp.31
	%tmp.32 = getelementptr %String, %String* @String.4, i32 0, i32 1
	%tmp.30 = load i8*, i8** %tmp.32
	%tmp.33 = call i32(i8*, i8*) @strcmp( i8* %tmp.29, i8* %tmp.30 )
	%tmp.28 = icmp eq i32 %tmp.33, 0
	br i1 %tmp.28, label %true.3, label %false.3

true.3:
	store i32 3, i32* %tmp.26
	br label %end.3

false.3:
	%tmp.34 = alloca i32
	%tmp.35 = load %String*, %String** %tmp.1
	%tmp.39 = getelementptr %String, %String* %tmp.35, i32 0, i32 1
	%tmp.37 = load i8*, i8** %tmp.39
	%tmp.40 = getelementptr %String, %String* @String.5, i32 0, i32 1
	%tmp.38 = load i8*, i8** %tmp.40
	%tmp.41 = call i32(i8*, i8*) @strcmp( i8* %tmp.37, i8* %tmp.38 )
	%tmp.36 = icmp eq i32 %tmp.41, 0
	br i1 %tmp.36, label %true.4, label %false.4

true.4:
	store i32 4, i32* %tmp.34
	br label %end.4

false.4:
	%tmp.42 = alloca i32
	%tmp.43 = load %String*, %String** %tmp.1
	%tmp.47 = getelementptr %String, %String* %tmp.43, i32 0, i32 1
	%tmp.45 = load i8*, i8** %tmp.47
	%tmp.48 = getelementptr %String, %String* @String.6, i32 0, i32 1
	%tmp.46 = load i8*, i8** %tmp.48
	%tmp.49 = call i32(i8*, i8*) @strcmp( i8* %tmp.45, i8* %tmp.46 )
	%tmp.44 = icmp eq i32 %tmp.49, 0
	br i1 %tmp.44, label %true.5, label %false.5

true.5:
	store i32 5, i32* %tmp.42
	br label %end.5

false.5:
	%tmp.50 = alloca i32
	%tmp.51 = load %String*, %String** %tmp.1
	%tmp.55 = getelementptr %String, %String* %tmp.51, i32 0, i32 1
	%tmp.53 = load i8*, i8** %tmp.55
	%tmp.56 = getelementptr %String, %String* @String.7, i32 0, i32 1
	%tmp.54 = load i8*, i8** %tmp.56
	%tmp.57 = call i32(i8*, i8*) @strcmp( i8* %tmp.53, i8* %tmp.54 )
	%tmp.52 = icmp eq i32 %tmp.57, 0
	br i1 %tmp.52, label %true.6, label %false.6

true.6:
	store i32 6, i32* %tmp.50
	br label %end.6

false.6:
	%tmp.58 = alloca i32
	%tmp.59 = load %String*, %String** %tmp.1
	%tmp.63 = getelementptr %String, %String* %tmp.59, i32 0, i32 1
	%tmp.61 = load i8*, i8** %tmp.63
	%tmp.64 = getelementptr %String, %String* @String.8, i32 0, i32 1
	%tmp.62 = load i8*, i8** %tmp.64
	%tmp.65 = call i32(i8*, i8*) @strcmp( i8* %tmp.61, i8* %tmp.62 )
	%tmp.60 = icmp eq i32 %tmp.65, 0
	br i1 %tmp.60, label %true.7, label %false.7

true.7:
	store i32 7, i32* %tmp.58
	br label %end.7

false.7:
	%tmp.66 = alloca i32
	%tmp.67 = load %String*, %String** %tmp.1
	%tmp.71 = getelementptr %String, %String* %tmp.67, i32 0, i32 1
	%tmp.69 = load i8*, i8** %tmp.71
	%tmp.72 = getelementptr %String, %String* @String.9, i32 0, i32 1
	%tmp.70 = load i8*, i8** %tmp.72
	%tmp.73 = call i32(i8*, i8*) @strcmp( i8* %tmp.69, i8* %tmp.70 )
	%tmp.68 = icmp eq i32 %tmp.73, 0
	br i1 %tmp.68, label %true.8, label %false.8

true.8:
	store i32 8, i32* %tmp.66
	br label %end.8

false.8:
	%tmp.74 = alloca i32
	%tmp.75 = load %String*, %String** %tmp.1
	%tmp.79 = getelementptr %String, %String* %tmp.75, i32 0, i32 1
	%tmp.77 = load i8*, i8** %tmp.79
	%tmp.80 = getelementptr %String, %String* @String.10, i32 0, i32 1
	%tmp.78 = load i8*, i8** %tmp.80
	%tmp.81 = call i32(i8*, i8*) @strcmp( i8* %tmp.77, i8* %tmp.78 )
	%tmp.76 = icmp eq i32 %tmp.81, 0
	br i1 %tmp.76, label %true.9, label %false.9

true.9:
	store i32 9, i32* %tmp.74
	br label %end.9

false.9:
	%tmp.82 = load %A2I*, %A2I** %tmp.0
	%tmp.83 = icmp eq %A2I* %tmp.82, null
	br i1 %tmp.83, label %abort, label %ok.0

ok.0:
	%tmp.84 = getelementptr %A2I, %A2I* %tmp.82, i32 0, i32 0
	%tmp.85 = load %A2I_vtable*, %A2I_vtable** %tmp.84
	%tmp.86 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.85, i32 0, i32 4
	%tmp.87 = load %Object* (%A2I*) *, %Object* (%A2I*) ** %tmp.86
	%tmp.88 = call %Object*(%A2I*) %tmp.87( %A2I* %tmp.82 )
	store i32 0, i32* %tmp.74
	br label %end.9

end.9:
	%tmp.89 = load i32, i32* %tmp.74
	store i32 %tmp.89, i32* %tmp.66
	br label %end.8

end.8:
	%tmp.90 = load i32, i32* %tmp.66
	store i32 %tmp.90, i32* %tmp.58
	br label %end.7

end.7:
	%tmp.91 = load i32, i32* %tmp.58
	store i32 %tmp.91, i32* %tmp.50
	br label %end.6

end.6:
	%tmp.92 = load i32, i32* %tmp.50
	store i32 %tmp.92, i32* %tmp.42
	br label %end.5

end.5:
	%tmp.93 = load i32, i32* %tmp.42
	store i32 %tmp.93, i32* %tmp.34
	br label %end.4

end.4:
	%tmp.94 = load i32, i32* %tmp.34
	store i32 %tmp.94, i32* %tmp.26
	br label %end.3

end.3:
	%tmp.95 = load i32, i32* %tmp.26
	store i32 %tmp.95, i32* %tmp.18
	br label %end.2

end.2:
	%tmp.96 = load i32, i32* %tmp.18
	store i32 %tmp.96, i32* %tmp.10
	br label %end.1

end.1:
	%tmp.97 = load i32, i32* %tmp.10
	store i32 %tmp.97, i32* %tmp.2
	br label %end.0

end.0:
	%tmp.98 = load i32, i32* %tmp.2
	ret i32 %tmp.98

abort:
	call void @abort(  )
	unreachable
}

define %String* @A2I_i2c(%A2I* %self, i32 %i) {

entry:
	%tmp.99 = alloca %A2I*
	store %A2I* %self, %A2I** %tmp.99
	%tmp.100 = alloca i32
	store i32 %i, i32* %tmp.100
	%tmp.101 = alloca %String*
	%tmp.102 = load i32, i32* %tmp.100
	%tmp.103 = icmp eq i32 %tmp.102, 0
	br i1 %tmp.103, label %true.10, label %false.10

true.10:
	store %String* @String.1, %String** %tmp.101
	br label %end.10

false.10:
	%tmp.104 = alloca %String*
	%tmp.105 = load i32, i32* %tmp.100
	%tmp.106 = icmp eq i32 %tmp.105, 1
	br i1 %tmp.106, label %true.11, label %false.11

true.11:
	store %String* @String.2, %String** %tmp.104
	br label %end.11

false.11:
	%tmp.107 = alloca %String*
	%tmp.108 = load i32, i32* %tmp.100
	%tmp.109 = icmp eq i32 %tmp.108, 2
	br i1 %tmp.109, label %true.12, label %false.12

true.12:
	store %String* @String.3, %String** %tmp.107
	br label %end.12

false.12:
	%tmp.110 = alloca %String*
	%tmp.111 = load i32, i32* %tmp.100
	%tmp.112 = icmp eq i32 %tmp.111, 3
	br i1 %tmp.112, label %true.13, label %false.13

true.13:
	store %String* @String.4, %String** %tmp.110
	br label %end.13

false.13:
	%tmp.113 = alloca %String*
	%tmp.114 = load i32, i32* %tmp.100
	%tmp.115 = icmp eq i32 %tmp.114, 4
	br i1 %tmp.115, label %true.14, label %false.14

true.14:
	store %String* @String.5, %String** %tmp.113
	br label %end.14

false.14:
	%tmp.116 = alloca %String*
	%tmp.117 = load i32, i32* %tmp.100
	%tmp.118 = icmp eq i32 %tmp.117, 5
	br i1 %tmp.118, label %true.15, label %false.15

true.15:
	store %String* @String.6, %String** %tmp.116
	br label %end.15

false.15:
	%tmp.119 = alloca %String*
	%tmp.120 = load i32, i32* %tmp.100
	%tmp.121 = icmp eq i32 %tmp.120, 6
	br i1 %tmp.121, label %true.16, label %false.16

true.16:
	store %String* @String.7, %String** %tmp.119
	br label %end.16

false.16:
	%tmp.122 = alloca %String*
	%tmp.123 = load i32, i32* %tmp.100
	%tmp.124 = icmp eq i32 %tmp.123, 7
	br i1 %tmp.124, label %true.17, label %false.17

true.17:
	store %String* @String.8, %String** %tmp.122
	br label %end.17

false.17:
	%tmp.125 = alloca %String*
	%tmp.126 = load i32, i32* %tmp.100
	%tmp.127 = icmp eq i32 %tmp.126, 8
	br i1 %tmp.127, label %true.18, label %false.18

true.18:
	store %String* @String.9, %String** %tmp.125
	br label %end.18

false.18:
	%tmp.128 = alloca %String*
	%tmp.129 = load i32, i32* %tmp.100
	%tmp.130 = icmp eq i32 %tmp.129, 9
	br i1 %tmp.130, label %true.19, label %false.19

true.19:
	store %String* @String.10, %String** %tmp.128
	br label %end.19

false.19:
	%tmp.131 = load %A2I*, %A2I** %tmp.99
	%tmp.132 = icmp eq %A2I* %tmp.131, null
	br i1 %tmp.132, label %abort, label %ok.1

ok.1:
	%tmp.133 = getelementptr %A2I, %A2I* %tmp.131, i32 0, i32 0
	%tmp.134 = load %A2I_vtable*, %A2I_vtable** %tmp.133
	%tmp.135 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.134, i32 0, i32 4
	%tmp.136 = load %Object* (%A2I*) *, %Object* (%A2I*) ** %tmp.135
	%tmp.137 = call %Object*(%A2I*) %tmp.136( %A2I* %tmp.131 )
	store %String* @String.11, %String** %tmp.128
	br label %end.19

end.19:
	%tmp.138 = load %String*, %String** %tmp.128
	store %String* %tmp.138, %String** %tmp.125
	br label %end.18

end.18:
	%tmp.139 = load %String*, %String** %tmp.125
	store %String* %tmp.139, %String** %tmp.122
	br label %end.17

end.17:
	%tmp.140 = load %String*, %String** %tmp.122
	store %String* %tmp.140, %String** %tmp.119
	br label %end.16

end.16:
	%tmp.141 = load %String*, %String** %tmp.119
	store %String* %tmp.141, %String** %tmp.116
	br label %end.15

end.15:
	%tmp.142 = load %String*, %String** %tmp.116
	store %String* %tmp.142, %String** %tmp.113
	br label %end.14

end.14:
	%tmp.143 = load %String*, %String** %tmp.113
	store %String* %tmp.143, %String** %tmp.110
	br label %end.13

end.13:
	%tmp.144 = load %String*, %String** %tmp.110
	store %String* %tmp.144, %String** %tmp.107
	br label %end.12

end.12:
	%tmp.145 = load %String*, %String** %tmp.107
	store %String* %tmp.145, %String** %tmp.104
	br label %end.11

end.11:
	%tmp.146 = load %String*, %String** %tmp.104
	store %String* %tmp.146, %String** %tmp.101
	br label %end.10

end.10:
	%tmp.147 = load %String*, %String** %tmp.101
	ret %String* %tmp.147

abort:
	call void @abort(  )
	unreachable
}

define i32 @A2I_a2i(%A2I* %self, %String* %s) {

entry:
	%tmp.148 = alloca %A2I*
	store %A2I* %self, %A2I** %tmp.148
	%tmp.149 = alloca %String*
	store %String* %s, %String** %tmp.149
	%tmp.150 = alloca i32
	%tmp.151 = load %String*, %String** %tmp.149
	%tmp.152 = icmp eq %String* %tmp.151, null
	br i1 %tmp.152, label %abort, label %ok.2

ok.2:
	%tmp.153 = getelementptr %String, %String* %tmp.151, i32 0, i32 0
	%tmp.154 = load %String_vtable*, %String_vtable** %tmp.153
	%tmp.155 = getelementptr %String_vtable, %String_vtable* %tmp.154, i32 0, i32 7
	%tmp.156 = load i32 (%String*) *, i32 (%String*) ** %tmp.155
	%tmp.157 = call i32(%String*) %tmp.156( %String* %tmp.151 )
	%tmp.158 = icmp eq i32 %tmp.157, 0
	br i1 %tmp.158, label %true.20, label %false.20

true.20:
	store i32 0, i32* %tmp.150
	br label %end.20

false.20:
	%tmp.159 = alloca i32
	%tmp.160 = load %String*, %String** %tmp.149
	%tmp.161 = icmp eq %String* %tmp.160, null
	br i1 %tmp.161, label %abort, label %ok.3

ok.3:
	%tmp.162 = getelementptr %String, %String* %tmp.160, i32 0, i32 0
	%tmp.163 = load %String_vtable*, %String_vtable** %tmp.162
	%tmp.164 = getelementptr %String_vtable, %String_vtable* %tmp.163, i32 0, i32 9
	%tmp.165 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %tmp.164
	%tmp.166 = call %String*(%String*, i32, i32) %tmp.165( %String* %tmp.160, i32 0, i32 1 )
	%tmp.170 = getelementptr %String, %String* %tmp.166, i32 0, i32 1
	%tmp.168 = load i8*, i8** %tmp.170
	%tmp.171 = getelementptr %String, %String* @String.12, i32 0, i32 1
	%tmp.169 = load i8*, i8** %tmp.171
	%tmp.172 = call i32(i8*, i8*) @strcmp( i8* %tmp.168, i8* %tmp.169 )
	%tmp.167 = icmp eq i32 %tmp.172, 0
	br i1 %tmp.167, label %true.21, label %false.21

true.21:
	%tmp.173 = load %String*, %String** %tmp.149
	%tmp.174 = icmp eq %String* %tmp.173, null
	br i1 %tmp.174, label %abort, label %ok.6

ok.6:
	%tmp.175 = getelementptr %String, %String* %tmp.173, i32 0, i32 0
	%tmp.176 = load %String_vtable*, %String_vtable** %tmp.175
	%tmp.177 = getelementptr %String_vtable, %String_vtable* %tmp.176, i32 0, i32 7
	%tmp.178 = load i32 (%String*) *, i32 (%String*) ** %tmp.177
	%tmp.179 = call i32(%String*) %tmp.178( %String* %tmp.173 )
	%tmp.180 = sub i32 %tmp.179, 1
	%tmp.181 = load %String*, %String** %tmp.149
	%tmp.182 = icmp eq %String* %tmp.181, null
	br i1 %tmp.182, label %abort, label %ok.5

ok.5:
	%tmp.183 = getelementptr %String, %String* %tmp.181, i32 0, i32 0
	%tmp.184 = load %String_vtable*, %String_vtable** %tmp.183
	%tmp.185 = getelementptr %String_vtable, %String_vtable* %tmp.184, i32 0, i32 9
	%tmp.186 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %tmp.185
	%tmp.187 = call %String*(%String*, i32, i32) %tmp.186( %String* %tmp.181, i32 1, i32 %tmp.180 )
	%tmp.188 = load %A2I*, %A2I** %tmp.148
	%tmp.189 = icmp eq %A2I* %tmp.188, null
	br i1 %tmp.189, label %abort, label %ok.4

ok.4:
	%tmp.190 = getelementptr %A2I, %A2I* %tmp.188, i32 0, i32 0
	%tmp.191 = load %A2I_vtable*, %A2I_vtable** %tmp.190
	%tmp.192 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.191, i32 0, i32 10
	%tmp.193 = load i32 (%A2I*,%String*) *, i32 (%A2I*,%String*) ** %tmp.192
	%tmp.194 = call i32(%A2I*, %String*) %tmp.193( %A2I* %tmp.188, %String* %tmp.187 )
	%tmp.195 = sub i32 0, %tmp.194
	store i32 %tmp.195, i32* %tmp.159
	br label %end.21

false.21:
	%tmp.196 = alloca i32
	%tmp.197 = load %String*, %String** %tmp.149
	%tmp.198 = icmp eq %String* %tmp.197, null
	br i1 %tmp.198, label %abort, label %ok.7

ok.7:
	%tmp.199 = getelementptr %String, %String* %tmp.197, i32 0, i32 0
	%tmp.200 = load %String_vtable*, %String_vtable** %tmp.199
	%tmp.201 = getelementptr %String_vtable, %String_vtable* %tmp.200, i32 0, i32 9
	%tmp.202 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %tmp.201
	%tmp.203 = call %String*(%String*, i32, i32) %tmp.202( %String* %tmp.197, i32 0, i32 1 )
	%tmp.207 = getelementptr %String, %String* %tmp.203, i32 0, i32 1
	%tmp.205 = load i8*, i8** %tmp.207
	%tmp.208 = getelementptr %String, %String* @String.13, i32 0, i32 1
	%tmp.206 = load i8*, i8** %tmp.208
	%tmp.209 = call i32(i8*, i8*) @strcmp( i8* %tmp.205, i8* %tmp.206 )
	%tmp.204 = icmp eq i32 %tmp.209, 0
	br i1 %tmp.204, label %true.22, label %false.22

true.22:
	%tmp.210 = load %String*, %String** %tmp.149
	%tmp.211 = icmp eq %String* %tmp.210, null
	br i1 %tmp.211, label %abort, label %ok.10

ok.10:
	%tmp.212 = getelementptr %String, %String* %tmp.210, i32 0, i32 0
	%tmp.213 = load %String_vtable*, %String_vtable** %tmp.212
	%tmp.214 = getelementptr %String_vtable, %String_vtable* %tmp.213, i32 0, i32 7
	%tmp.215 = load i32 (%String*) *, i32 (%String*) ** %tmp.214
	%tmp.216 = call i32(%String*) %tmp.215( %String* %tmp.210 )
	%tmp.217 = sub i32 %tmp.216, 1
	%tmp.218 = load %String*, %String** %tmp.149
	%tmp.219 = icmp eq %String* %tmp.218, null
	br i1 %tmp.219, label %abort, label %ok.9

ok.9:
	%tmp.220 = getelementptr %String, %String* %tmp.218, i32 0, i32 0
	%tmp.221 = load %String_vtable*, %String_vtable** %tmp.220
	%tmp.222 = getelementptr %String_vtable, %String_vtable* %tmp.221, i32 0, i32 9
	%tmp.223 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %tmp.222
	%tmp.224 = call %String*(%String*, i32, i32) %tmp.223( %String* %tmp.218, i32 1, i32 %tmp.217 )
	%tmp.225 = load %A2I*, %A2I** %tmp.148
	%tmp.226 = icmp eq %A2I* %tmp.225, null
	br i1 %tmp.226, label %abort, label %ok.8

ok.8:
	%tmp.227 = getelementptr %A2I, %A2I* %tmp.225, i32 0, i32 0
	%tmp.228 = load %A2I_vtable*, %A2I_vtable** %tmp.227
	%tmp.229 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.228, i32 0, i32 10
	%tmp.230 = load i32 (%A2I*,%String*) *, i32 (%A2I*,%String*) ** %tmp.229
	%tmp.231 = call i32(%A2I*, %String*) %tmp.230( %A2I* %tmp.225, %String* %tmp.224 )
	store i32 %tmp.231, i32* %tmp.196
	br label %end.22

false.22:
	%tmp.232 = load %String*, %String** %tmp.149
	%tmp.233 = load %A2I*, %A2I** %tmp.148
	%tmp.234 = icmp eq %A2I* %tmp.233, null
	br i1 %tmp.234, label %abort, label %ok.11

ok.11:
	%tmp.235 = getelementptr %A2I, %A2I* %tmp.233, i32 0, i32 0
	%tmp.236 = load %A2I_vtable*, %A2I_vtable** %tmp.235
	%tmp.237 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.236, i32 0, i32 10
	%tmp.238 = load i32 (%A2I*,%String*) *, i32 (%A2I*,%String*) ** %tmp.237
	%tmp.239 = call i32(%A2I*, %String*) %tmp.238( %A2I* %tmp.233, %String* %tmp.232 )
	store i32 %tmp.239, i32* %tmp.196
	br label %end.22

end.22:
	%tmp.240 = load i32, i32* %tmp.196
	store i32 %tmp.240, i32* %tmp.159
	br label %end.21

end.21:
	%tmp.241 = load i32, i32* %tmp.159
	store i32 %tmp.241, i32* %tmp.150
	br label %end.20

end.20:
	%tmp.242 = load i32, i32* %tmp.150
	ret i32 %tmp.242

abort:
	call void @abort(  )
	unreachable
}

define i32 @A2I_a2i_aux(%A2I* %self, %String* %s) {

entry:
	%tmp.243 = alloca %A2I*
	store %A2I* %self, %A2I** %tmp.243
	%tmp.244 = alloca %String*
	store %String* %s, %String** %tmp.244
	%tmp.245 = alloca i32
	store i32 0, i32* %tmp.245
	%tmp.246 = load %String*, %String** %tmp.244
	%tmp.247 = icmp eq %String* %tmp.246, null
	br i1 %tmp.247, label %abort, label %ok.12

ok.12:
	%tmp.248 = getelementptr %String, %String* %tmp.246, i32 0, i32 0
	%tmp.249 = load %String_vtable*, %String_vtable** %tmp.248
	%tmp.250 = getelementptr %String_vtable, %String_vtable* %tmp.249, i32 0, i32 7
	%tmp.251 = load i32 (%String*) *, i32 (%String*) ** %tmp.250
	%tmp.252 = call i32(%String*) %tmp.251( %String* %tmp.246 )
	%tmp.253 = alloca i32
	store i32 %tmp.252, i32* %tmp.253
	%tmp.254 = alloca i32
	store i32 0, i32* %tmp.254
	br label %loop.23

loop.23:
	%tmp.255 = load i32, i32* %tmp.254
	%tmp.256 = load i32, i32* %tmp.253
	%tmp.257 = icmp slt i32 %tmp.255, %tmp.256
	br i1 %tmp.257, label %true.23, label %false.23

true.23:
	%tmp.258 = load i32, i32* %tmp.245
	%tmp.259 = mul i32 %tmp.258, 10
	%tmp.260 = load i32, i32* %tmp.254
	%tmp.261 = load %String*, %String** %tmp.244
	%tmp.262 = icmp eq %String* %tmp.261, null
	br i1 %tmp.262, label %abort, label %ok.14

ok.14:
	%tmp.263 = getelementptr %String, %String* %tmp.261, i32 0, i32 0
	%tmp.264 = load %String_vtable*, %String_vtable** %tmp.263
	%tmp.265 = getelementptr %String_vtable, %String_vtable* %tmp.264, i32 0, i32 9
	%tmp.266 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %tmp.265
	%tmp.267 = call %String*(%String*, i32, i32) %tmp.266( %String* %tmp.261, i32 %tmp.260, i32 1 )
	%tmp.268 = load %A2I*, %A2I** %tmp.243
	%tmp.269 = icmp eq %A2I* %tmp.268, null
	br i1 %tmp.269, label %abort, label %ok.13

ok.13:
	%tmp.270 = getelementptr %A2I, %A2I* %tmp.268, i32 0, i32 0
	%tmp.271 = load %A2I_vtable*, %A2I_vtable** %tmp.270
	%tmp.272 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.271, i32 0, i32 7
	%tmp.273 = load i32 (%A2I*,%String*) *, i32 (%A2I*,%String*) ** %tmp.272
	%tmp.274 = call i32(%A2I*, %String*) %tmp.273( %A2I* %tmp.268, %String* %tmp.267 )
	%tmp.275 = add i32 %tmp.259, %tmp.274
	store i32 %tmp.275, i32* %tmp.245
	%tmp.276 = load i32, i32* %tmp.254
	%tmp.277 = add i32 %tmp.276, 1
	store i32 %tmp.277, i32* %tmp.254
	br label %loop.23

false.23:
	%tmp.278 = load i32, i32* %tmp.245
	ret i32 %tmp.278

abort:
	call void @abort(  )
	unreachable
}

define %String* @A2I_i2a(%A2I* %self, i32 %i) {

entry:
	%tmp.279 = alloca %A2I*
	store %A2I* %self, %A2I** %tmp.279
	%tmp.280 = alloca i32
	store i32 %i, i32* %tmp.280
	%tmp.281 = alloca %String*
	%tmp.282 = load i32, i32* %tmp.280
	%tmp.283 = icmp eq i32 %tmp.282, 0
	br i1 %tmp.283, label %true.24, label %false.24

true.24:
	store %String* @String.1, %String** %tmp.281
	br label %end.24

false.24:
	%tmp.284 = alloca %String*
	%tmp.285 = load i32, i32* %tmp.280
	%tmp.286 = icmp slt i32 0, %tmp.285
	br i1 %tmp.286, label %true.25, label %false.25

true.25:
	%tmp.287 = load i32, i32* %tmp.280
	%tmp.288 = load %A2I*, %A2I** %tmp.279
	%tmp.289 = icmp eq %A2I* %tmp.288, null
	br i1 %tmp.289, label %abort, label %ok.15

ok.15:
	%tmp.290 = getelementptr %A2I, %A2I* %tmp.288, i32 0, i32 0
	%tmp.291 = load %A2I_vtable*, %A2I_vtable** %tmp.290
	%tmp.292 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.291, i32 0, i32 12
	%tmp.293 = load %String* (%A2I*,i32) *, %String* (%A2I*,i32) ** %tmp.292
	%tmp.294 = call %String*(%A2I*, i32) %tmp.293( %A2I* %tmp.288, i32 %tmp.287 )
	store %String* %tmp.294, %String** %tmp.284
	br label %end.25

false.25:
	%tmp.295 = load i32, i32* %tmp.280
	%tmp.296 = sub i32 0, 1
	%tmp.297 = mul i32 %tmp.295, %tmp.296
	%tmp.298 = load %A2I*, %A2I** %tmp.279
	%tmp.299 = icmp eq %A2I* %tmp.298, null
	br i1 %tmp.299, label %abort, label %ok.17

ok.17:
	%tmp.300 = getelementptr %A2I, %A2I* %tmp.298, i32 0, i32 0
	%tmp.301 = load %A2I_vtable*, %A2I_vtable** %tmp.300
	%tmp.302 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.301, i32 0, i32 12
	%tmp.303 = load %String* (%A2I*,i32) *, %String* (%A2I*,i32) ** %tmp.302
	%tmp.304 = call %String*(%A2I*, i32) %tmp.303( %A2I* %tmp.298, i32 %tmp.297 )
	%tmp.305 = icmp eq %String* @String.12, null
	br i1 %tmp.305, label %abort, label %ok.16

ok.16:
	%tmp.306 = getelementptr %String, %String* @String.12, i32 0, i32 0
	%tmp.307 = load %String_vtable*, %String_vtable** %tmp.306
	%tmp.308 = getelementptr %String_vtable, %String_vtable* %tmp.307, i32 0, i32 8
	%tmp.309 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %tmp.308
	%tmp.310 = call %String*(%String*, %String*) %tmp.309( %String* @String.12, %String* %tmp.304 )
	store %String* %tmp.310, %String** %tmp.284
	br label %end.25

end.25:
	%tmp.311 = load %String*, %String** %tmp.284
	store %String* %tmp.311, %String** %tmp.281
	br label %end.24

end.24:
	%tmp.312 = load %String*, %String** %tmp.281
	ret %String* %tmp.312

abort:
	call void @abort(  )
	unreachable
}

define %String* @A2I_i2a_aux(%A2I* %self, i32 %i) {

entry:
	%tmp.313 = alloca %A2I*
	store %A2I* %self, %A2I** %tmp.313
	%tmp.314 = alloca i32
	store i32 %i, i32* %tmp.314
	%tmp.315 = alloca %String*
	%tmp.316 = load i32, i32* %tmp.314
	%tmp.317 = icmp eq i32 %tmp.316, 0
	br i1 %tmp.317, label %true.26, label %false.26

true.26:
	store %String* @String.11, %String** %tmp.315
	br label %end.26

false.26:
	%tmp.318 = load i32, i32* %tmp.314
	%tmp.319 = icmp eq i32 10, 0
	br i1 %tmp.319, label %abort, label %ok.18

ok.18:
	%tmp.320 = sdiv i32 %tmp.318, 10
	%tmp.321 = alloca i32
	store i32 %tmp.320, i32* %tmp.321
	%tmp.322 = load i32, i32* %tmp.314
	%tmp.323 = load i32, i32* %tmp.321
	%tmp.324 = mul i32 %tmp.323, 10
	%tmp.325 = sub i32 %tmp.322, %tmp.324
	%tmp.326 = load %A2I*, %A2I** %tmp.313
	%tmp.327 = icmp eq %A2I* %tmp.326, null
	br i1 %tmp.327, label %abort, label %ok.20

ok.20:
	%tmp.328 = getelementptr %A2I, %A2I* %tmp.326, i32 0, i32 0
	%tmp.329 = load %A2I_vtable*, %A2I_vtable** %tmp.328
	%tmp.330 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.329, i32 0, i32 8
	%tmp.331 = load %String* (%A2I*,i32) *, %String* (%A2I*,i32) ** %tmp.330
	%tmp.332 = call %String*(%A2I*, i32) %tmp.331( %A2I* %tmp.326, i32 %tmp.325 )
	%tmp.333 = load i32, i32* %tmp.321
	%tmp.334 = load %A2I*, %A2I** %tmp.313
	%tmp.335 = icmp eq %A2I* %tmp.334, null
	br i1 %tmp.335, label %abort, label %ok.21

ok.21:
	%tmp.336 = getelementptr %A2I, %A2I* %tmp.334, i32 0, i32 0
	%tmp.337 = load %A2I_vtable*, %A2I_vtable** %tmp.336
	%tmp.338 = getelementptr %A2I_vtable, %A2I_vtable* %tmp.337, i32 0, i32 12
	%tmp.339 = load %String* (%A2I*,i32) *, %String* (%A2I*,i32) ** %tmp.338
	%tmp.340 = call %String*(%A2I*, i32) %tmp.339( %A2I* %tmp.334, i32 %tmp.333 )
	%tmp.341 = icmp eq %String* %tmp.340, null
	br i1 %tmp.341, label %abort, label %ok.19

ok.19:
	%tmp.342 = getelementptr %String, %String* %tmp.340, i32 0, i32 0
	%tmp.343 = load %String_vtable*, %String_vtable** %tmp.342
	%tmp.344 = getelementptr %String_vtable, %String_vtable* %tmp.343, i32 0, i32 8
	%tmp.345 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %tmp.344
	%tmp.346 = call %String*(%String*, %String*) %tmp.345( %String* %tmp.340, %String* %tmp.332 )
	store %String* %tmp.346, %String** %tmp.315
	br label %end.26

end.26:
	%tmp.347 = load %String*, %String** %tmp.315
	ret %String* %tmp.347

abort:
	call void @abort(  )
	unreachable
}

define %A2I* @A2I_new() {

entry:
	%tmp.348 = getelementptr %A2I_vtable, %A2I_vtable* @A2I_vtable_prototype, i32 0, i32 1
	%tmp.349 = load i32, i32* %tmp.348
	%tmp.350 = call i8*(i32) @malloc( i32 %tmp.349 )
	%tmp.351 = bitcast i8* %tmp.350 to %A2I*
	%tmp.352 = getelementptr %A2I, %A2I* %tmp.351, i32 0, i32 0
	store %A2I_vtable* @A2I_vtable_prototype, %A2I_vtable** %tmp.352
	%tmp.353 = alloca %A2I*
	store %A2I* %tmp.351, %A2I** %tmp.353
	ret %A2I* %tmp.351

abort:
	call void @abort(  )
	unreachable
}

