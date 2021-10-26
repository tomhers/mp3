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
	%Object* (%Main*) * @Main_main
}

@str.A = internal constant [2 x i8] c"A\00", align 1
%A = type {
	%A_vtable*
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

@str.B = internal constant [2 x i8] c"B\00", align 1
%B = type {
	%B_vtable*
}

%B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *
}

@B_vtable_prototype = constant %B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *)
}

@str.C = internal constant [2 x i8] c"C\00", align 1
%C = type {
	%C_vtable*
}

%C_vtable = type {
	i32,
	i32,
	i8*,
	%C* () *,
	%Object* (%C*) *,
	%String* (%C*) *,
	%C* (%C*) *
}

@C_vtable_prototype = constant %C_vtable {
	i32 8,
	i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0),
	%C* () * @C_new,
	%Object* (%C*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%C*) *),
	%String* (%C*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%C*) *),
	%C* (%C*) * bitcast (%Object* (%Object*) * @Object_copy to %C* (%C*) *)
}

@str.D = internal constant [2 x i8] c"D\00", align 1
%D = type {
	%D_vtable*
}

%D_vtable = type {
	i32,
	i32,
	i8*,
	%D* () *,
	%Object* (%D*) *,
	%String* (%D*) *,
	%D* (%D*) *
}

@D_vtable_prototype = constant %D_vtable {
	i32 9,
	i32 ptrtoint (%D* getelementptr (%D, %D* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.D, i32 0, i32 0),
	%D* () * @D_new,
	%Object* (%D*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%D*) *),
	%String* (%D*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%D*) *),
	%D* (%D*) * bitcast (%Object* (%Object*) * @Object_copy to %D* (%D*) *)
}

@str.E = internal constant [2 x i8] c"E\00", align 1
%E = type {
	%E_vtable*
}

%E_vtable = type {
	i32,
	i32,
	i8*,
	%E* () *,
	%Object* (%E*) *,
	%String* (%E*) *,
	%E* (%E*) *
}

@E_vtable_prototype = constant %E_vtable {
	i32 10,
	i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0),
	%E* () * @E_new,
	%Object* (%E*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%E*) *),
	%String* (%E*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%E*) *),
	%E* (%E*) * bitcast (%Object* (%Object*) * @Object_copy to %E* (%E*) *)
}

@str.F = internal constant [2 x i8] c"F\00", align 1
%F = type {
	%F_vtable*
}

%F_vtable = type {
	i32,
	i32,
	i8*,
	%F* () *,
	%Object* (%F*) *,
	%String* (%F*) *,
	%F* (%F*) *
}

@F_vtable_prototype = constant %F_vtable {
	i32 11,
	i32 ptrtoint (%F* getelementptr (%F, %F* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.F, i32 0, i32 0),
	%F* () * @F_new,
	%Object* (%F*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%F*) *),
	%String* (%F*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%F*) *),
	%F* (%F*) * bitcast (%Object* (%Object*) * @Object_copy to %F* (%F*) *)
}

@str.G = internal constant [2 x i8] c"G\00", align 1
%G = type {
	%G_vtable*
}

%G_vtable = type {
	i32,
	i32,
	i8*,
	%G* () *,
	%Object* (%G*) *,
	%String* (%G*) *,
	%G* (%G*) *
}

@G_vtable_prototype = constant %G_vtable {
	i32 12,
	i32 ptrtoint (%G* getelementptr (%G, %G* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.G, i32 0, i32 0),
	%G* () * @G_new,
	%Object* (%G*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%G*) *),
	%String* (%G*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%G*) *),
	%G* (%G*) * bitcast (%Object* (%Object*) * @Object_copy to %G* (%G*) *)
}

@str.H = internal constant [2 x i8] c"H\00", align 1
%H = type {
	%H_vtable*
}

%H_vtable = type {
	i32,
	i32,
	i8*,
	%H* () *,
	%Object* (%H*) *,
	%String* (%H*) *,
	%H* (%H*) *
}

@H_vtable_prototype = constant %H_vtable {
	i32 13,
	i32 ptrtoint (%H* getelementptr (%H, %H* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.H, i32 0, i32 0),
	%H* () * @H_new,
	%Object* (%H*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%H*) *),
	%String* (%H*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%H*) *),
	%H* (%H*) * bitcast (%Object* (%Object*) * @Object_copy to %H* (%H*) *)
}

@str.I = internal constant [2 x i8] c"I\00", align 1
%I = type {
	%I_vtable*
}

%I_vtable = type {
	i32,
	i32,
	i8*,
	%I* () *,
	%Object* (%I*) *,
	%String* (%I*) *,
	%I* (%I*) *
}

@I_vtable_prototype = constant %I_vtable {
	i32 14,
	i32 ptrtoint (%I* getelementptr (%I, %I* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.I, i32 0, i32 0),
	%I* () * @I_new,
	%Object* (%I*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%I*) *),
	%String* (%I*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%I*) *),
	%I* (%I*) * bitcast (%Object* (%Object*) * @Object_copy to %I* (%I*) *)
}

@str.J = internal constant [2 x i8] c"J\00", align 1
%J = type {
	%J_vtable*
}

%J_vtable = type {
	i32,
	i32,
	i8*,
	%J* () *,
	%Object* (%J*) *,
	%String* (%J*) *,
	%J* (%J*) *
}

@J_vtable_prototype = constant %J_vtable {
	i32 15,
	i32 ptrtoint (%J* getelementptr (%J, %J* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.J, i32 0, i32 0),
	%J* () * @J_new,
	%Object* (%J*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%J*) *),
	%String* (%J*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%J*) *),
	%J* (%J*) * bitcast (%Object* (%Object*) * @Object_copy to %J* (%J*) *)
}

@str.K = internal constant [2 x i8] c"K\00", align 1
%K = type {
	%K_vtable*
}

%K_vtable = type {
	i32,
	i32,
	i8*,
	%K* () *,
	%Object* (%K*) *,
	%String* (%K*) *,
	%K* (%K*) *
}

@K_vtable_prototype = constant %K_vtable {
	i32 16,
	i32 ptrtoint (%K* getelementptr (%K, %K* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.K, i32 0, i32 0),
	%K* () * @K_new,
	%Object* (%K*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%K*) *),
	%String* (%K*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%K*) *),
	%K* (%K*) * bitcast (%Object* (%Object*) * @Object_copy to %K* (%K*) *)
}

@str.L = internal constant [2 x i8] c"L\00", align 1
%L = type {
	%L_vtable*
}

%L_vtable = type {
	i32,
	i32,
	i8*,
	%L* () *,
	%Object* (%L*) *,
	%String* (%L*) *,
	%L* (%L*) *
}

@L_vtable_prototype = constant %L_vtable {
	i32 17,
	i32 ptrtoint (%L* getelementptr (%L, %L* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.L, i32 0, i32 0),
	%L* () * @L_new,
	%Object* (%L*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%L*) *),
	%String* (%L*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%L*) *),
	%L* (%L*) * bitcast (%Object* (%Object*) * @Object_copy to %L* (%L*) *)
}

@str.M = internal constant [2 x i8] c"M\00", align 1
%M = type {
	%M_vtable*
}

%M_vtable = type {
	i32,
	i32,
	i8*,
	%M* () *,
	%Object* (%M*) *,
	%String* (%M*) *,
	%M* (%M*) *
}

@M_vtable_prototype = constant %M_vtable {
	i32 18,
	i32 ptrtoint (%M* getelementptr (%M, %M* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.M, i32 0, i32 0),
	%M* () * @M_new,
	%Object* (%M*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%M*) *),
	%String* (%M*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%M*) *),
	%M* (%M*) * bitcast (%Object* (%Object*) * @Object_copy to %M* (%M*) *)
}

@str.N = internal constant [2 x i8] c"N\00", align 1
%N = type {
	%N_vtable*
}

%N_vtable = type {
	i32,
	i32,
	i8*,
	%N* () *,
	%Object* (%N*) *,
	%String* (%N*) *,
	%N* (%N*) *
}

@N_vtable_prototype = constant %N_vtable {
	i32 19,
	i32 ptrtoint (%N* getelementptr (%N, %N* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.N, i32 0, i32 0),
	%N* () * @N_new,
	%Object* (%N*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%N*) *),
	%String* (%N*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%N*) *),
	%N* (%N*) * bitcast (%Object* (%Object*) * @Object_copy to %N* (%N*) *)
}

@str.O = internal constant [2 x i8] c"O\00", align 1
%O = type {
	%O_vtable*
}

%O_vtable = type {
	i32,
	i32,
	i8*,
	%O* () *,
	%Object* (%O*) *,
	%String* (%O*) *,
	%O* (%O*) *
}

@O_vtable_prototype = constant %O_vtable {
	i32 20,
	i32 ptrtoint (%O* getelementptr (%O, %O* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.O, i32 0, i32 0),
	%O* () * @O_new,
	%Object* (%O*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%O*) *),
	%String* (%O*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%O*) *),
	%O* (%O*) * bitcast (%Object* (%Object*) * @Object_copy to %O* (%O*) *)
}

@str.P = internal constant [2 x i8] c"P\00", align 1
%P = type {
	%P_vtable*
}

%P_vtable = type {
	i32,
	i32,
	i8*,
	%P* () *,
	%Object* (%P*) *,
	%String* (%P*) *,
	%P* (%P*) *
}

@P_vtable_prototype = constant %P_vtable {
	i32 21,
	i32 ptrtoint (%P* getelementptr (%P, %P* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.P, i32 0, i32 0),
	%P* () * @P_new,
	%Object* (%P*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%P*) *),
	%String* (%P*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%P*) *),
	%P* (%P*) * bitcast (%Object* (%Object*) * @Object_copy to %P* (%P*) *)
}

@str.Q = internal constant [2 x i8] c"Q\00", align 1
%Q = type {
	%Q_vtable*
}

%Q_vtable = type {
	i32,
	i32,
	i8*,
	%Q* () *,
	%Object* (%Q*) *,
	%String* (%Q*) *,
	%Q* (%Q*) *
}

@Q_vtable_prototype = constant %Q_vtable {
	i32 22,
	i32 ptrtoint (%Q* getelementptr (%Q, %Q* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.Q, i32 0, i32 0),
	%Q* () * @Q_new,
	%Object* (%Q*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Q*) *),
	%String* (%Q*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Q*) *),
	%Q* (%Q*) * bitcast (%Object* (%Object*) * @Object_copy to %Q* (%Q*) *)
}

@str.1 = internal constant [14 x i8] c"<basic class>\00", align 1
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [14 x i8] c"caseloop_o.cl\00", align 1
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call %Object*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main_main(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = alloca i32
	store i32 0, i32* %tmp.1
	%tmp.2 = alloca i32
	store i32 0, i32* %tmp.2
	%tmp.3 = call %A* @A_new(  )
	%tmp.4 = alloca %Object*
	%tmp.5 = bitcast %A* %tmp.3 to %Object*
	store %Object* %tmp.5, %Object** %tmp.4
	%tmp.6 = call %Q* @Q_new(  )
	%tmp.7 = alloca %Object*
	%tmp.8 = bitcast %Q* %tmp.6 to %Object*
	store %Object* %tmp.8, %Object** %tmp.7
	%tmp.9 = alloca i32
	store i32 0, i32* %tmp.9
	br label %loop.0

loop.0:
	%tmp.10 = load i32, i32* %tmp.1
	%tmp.11 = icmp slt i32 %tmp.10, 100
	br i1 %tmp.11, label %true.0, label %false.0

true.0:
	%tmp.12 = load %Object*, %Object** %tmp.7
	%tmp.13 = icmp eq %Object* %tmp.12, null
	br i1 %tmp.13, label %abort, label %ok.0

ok.0:
	%tmp.14 = getelementptr %Object, %Object* %tmp.12, i32 0, i32 0
	%tmp.15 = load %Object_vtable*, %Object_vtable** %tmp.14
	%tmp.16 = getelementptr %Object_vtable, %Object_vtable* %tmp.15, i32 0, i32 0
	%tmp.17 = load i32, i32* %tmp.16
	br label %case.hdr.1

case.hdr.1:
	%tmp.18 = alloca %Int*
	br label %case.22.1

case.22.1:
	%vtpm.0 = icmp slt i32 %tmp.17, 22
	br i1 %vtpm.0, label %br_exit.22.1, label %src_gte_br.22.1

src_gte_br.22.1:
	%vtpm.1 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.1, label %br_exit.22.1, label %src_lte_mc.22.1

src_lte_mc.22.1:
	%vtpm.2 = alloca %Q*
	%tmp.19 = bitcast %Object* %tmp.12 to %Q*
	store %Q* %tmp.19, %Q** %vtpm.2
	%tmp.21 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.21, i32 17 )
	store %Int* %tmp.21, %Int** %tmp.18
	br label %case.exit.1

br_exit.22.1:
	br label %case.21.1

case.21.1:
	%vtpm.3 = icmp slt i32 %tmp.17, 21
	br i1 %vtpm.3, label %br_exit.21.1, label %src_gte_br.21.1

src_gte_br.21.1:
	%vtpm.4 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.4, label %br_exit.21.1, label %src_lte_mc.21.1

src_lte_mc.21.1:
	%vtpm.5 = alloca %P*
	%tmp.22 = bitcast %Object* %tmp.12 to %P*
	store %P* %tmp.22, %P** %vtpm.5
	%tmp.24 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.24, i32 16 )
	store %Int* %tmp.24, %Int** %tmp.18
	br label %case.exit.1

br_exit.21.1:
	br label %case.20.1

case.20.1:
	%vtpm.6 = icmp slt i32 %tmp.17, 20
	br i1 %vtpm.6, label %br_exit.20.1, label %src_gte_br.20.1

src_gte_br.20.1:
	%vtpm.7 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.7, label %br_exit.20.1, label %src_lte_mc.20.1

src_lte_mc.20.1:
	%vtpm.8 = alloca %O*
	%tmp.25 = bitcast %Object* %tmp.12 to %O*
	store %O* %tmp.25, %O** %vtpm.8
	%tmp.27 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.27, i32 15 )
	store %Int* %tmp.27, %Int** %tmp.18
	br label %case.exit.1

br_exit.20.1:
	br label %case.19.1

case.19.1:
	%vtpm.9 = icmp slt i32 %tmp.17, 19
	br i1 %vtpm.9, label %br_exit.19.1, label %src_gte_br.19.1

src_gte_br.19.1:
	%vtpm.10 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.10, label %br_exit.19.1, label %src_lte_mc.19.1

src_lte_mc.19.1:
	%vtpm.11 = alloca %N*
	%tmp.28 = bitcast %Object* %tmp.12 to %N*
	store %N* %tmp.28, %N** %vtpm.11
	%tmp.30 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.30, i32 14 )
	store %Int* %tmp.30, %Int** %tmp.18
	br label %case.exit.1

br_exit.19.1:
	br label %case.18.1

case.18.1:
	%vtpm.12 = icmp slt i32 %tmp.17, 18
	br i1 %vtpm.12, label %br_exit.18.1, label %src_gte_br.18.1

src_gte_br.18.1:
	%vtpm.13 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.13, label %br_exit.18.1, label %src_lte_mc.18.1

src_lte_mc.18.1:
	%vtpm.14 = alloca %M*
	%tmp.31 = bitcast %Object* %tmp.12 to %M*
	store %M* %tmp.31, %M** %vtpm.14
	%tmp.33 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.33, i32 13 )
	store %Int* %tmp.33, %Int** %tmp.18
	br label %case.exit.1

br_exit.18.1:
	br label %case.17.1

case.17.1:
	%vtpm.15 = icmp slt i32 %tmp.17, 17
	br i1 %vtpm.15, label %br_exit.17.1, label %src_gte_br.17.1

src_gte_br.17.1:
	%vtpm.16 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.16, label %br_exit.17.1, label %src_lte_mc.17.1

src_lte_mc.17.1:
	%vtpm.17 = alloca %L*
	%tmp.34 = bitcast %Object* %tmp.12 to %L*
	store %L* %tmp.34, %L** %vtpm.17
	%tmp.36 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.36, i32 12 )
	store %Int* %tmp.36, %Int** %tmp.18
	br label %case.exit.1

br_exit.17.1:
	br label %case.16.1

case.16.1:
	%vtpm.18 = icmp slt i32 %tmp.17, 16
	br i1 %vtpm.18, label %br_exit.16.1, label %src_gte_br.16.1

src_gte_br.16.1:
	%vtpm.19 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.19, label %br_exit.16.1, label %src_lte_mc.16.1

src_lte_mc.16.1:
	%vtpm.20 = alloca %K*
	%tmp.37 = bitcast %Object* %tmp.12 to %K*
	store %K* %tmp.37, %K** %vtpm.20
	%tmp.39 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.39, i32 11 )
	store %Int* %tmp.39, %Int** %tmp.18
	br label %case.exit.1

br_exit.16.1:
	br label %case.15.1

case.15.1:
	%vtpm.21 = icmp slt i32 %tmp.17, 15
	br i1 %vtpm.21, label %br_exit.15.1, label %src_gte_br.15.1

src_gte_br.15.1:
	%vtpm.22 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.22, label %br_exit.15.1, label %src_lte_mc.15.1

src_lte_mc.15.1:
	%vtpm.23 = alloca %J*
	%tmp.40 = bitcast %Object* %tmp.12 to %J*
	store %J* %tmp.40, %J** %vtpm.23
	%tmp.42 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.42, i32 10 )
	store %Int* %tmp.42, %Int** %tmp.18
	br label %case.exit.1

br_exit.15.1:
	br label %case.14.1

case.14.1:
	%vtpm.24 = icmp slt i32 %tmp.17, 14
	br i1 %vtpm.24, label %br_exit.14.1, label %src_gte_br.14.1

src_gte_br.14.1:
	%vtpm.25 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.25, label %br_exit.14.1, label %src_lte_mc.14.1

src_lte_mc.14.1:
	%vtpm.26 = alloca %I*
	%tmp.43 = bitcast %Object* %tmp.12 to %I*
	store %I* %tmp.43, %I** %vtpm.26
	%tmp.45 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.45, i32 9 )
	store %Int* %tmp.45, %Int** %tmp.18
	br label %case.exit.1

br_exit.14.1:
	br label %case.13.1

case.13.1:
	%vtpm.27 = icmp slt i32 %tmp.17, 13
	br i1 %vtpm.27, label %br_exit.13.1, label %src_gte_br.13.1

src_gte_br.13.1:
	%vtpm.28 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.28, label %br_exit.13.1, label %src_lte_mc.13.1

src_lte_mc.13.1:
	%vtpm.29 = alloca %H*
	%tmp.46 = bitcast %Object* %tmp.12 to %H*
	store %H* %tmp.46, %H** %vtpm.29
	%tmp.48 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.48, i32 8 )
	store %Int* %tmp.48, %Int** %tmp.18
	br label %case.exit.1

br_exit.13.1:
	br label %case.12.1

case.12.1:
	%vtpm.30 = icmp slt i32 %tmp.17, 12
	br i1 %vtpm.30, label %br_exit.12.1, label %src_gte_br.12.1

src_gte_br.12.1:
	%vtpm.31 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.31, label %br_exit.12.1, label %src_lte_mc.12.1

src_lte_mc.12.1:
	%vtpm.32 = alloca %G*
	%tmp.49 = bitcast %Object* %tmp.12 to %G*
	store %G* %tmp.49, %G** %vtpm.32
	%tmp.51 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.51, i32 7 )
	store %Int* %tmp.51, %Int** %tmp.18
	br label %case.exit.1

br_exit.12.1:
	br label %case.11.1

case.11.1:
	%vtpm.33 = icmp slt i32 %tmp.17, 11
	br i1 %vtpm.33, label %br_exit.11.1, label %src_gte_br.11.1

src_gte_br.11.1:
	%vtpm.34 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.34, label %br_exit.11.1, label %src_lte_mc.11.1

src_lte_mc.11.1:
	%vtpm.35 = alloca %F*
	%tmp.52 = bitcast %Object* %tmp.12 to %F*
	store %F* %tmp.52, %F** %vtpm.35
	%tmp.54 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.54, i32 6 )
	store %Int* %tmp.54, %Int** %tmp.18
	br label %case.exit.1

br_exit.11.1:
	br label %case.10.1

case.10.1:
	%vtpm.36 = icmp slt i32 %tmp.17, 10
	br i1 %vtpm.36, label %br_exit.10.1, label %src_gte_br.10.1

src_gte_br.10.1:
	%vtpm.37 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.37, label %br_exit.10.1, label %src_lte_mc.10.1

src_lte_mc.10.1:
	%vtpm.38 = alloca %E*
	%tmp.55 = bitcast %Object* %tmp.12 to %E*
	store %E* %tmp.55, %E** %vtpm.38
	%tmp.57 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.57, i32 5 )
	store %Int* %tmp.57, %Int** %tmp.18
	br label %case.exit.1

br_exit.10.1:
	br label %case.9.1

case.9.1:
	%vtpm.39 = icmp slt i32 %tmp.17, 9
	br i1 %vtpm.39, label %br_exit.9.1, label %src_gte_br.9.1

src_gte_br.9.1:
	%vtpm.40 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.40, label %br_exit.9.1, label %src_lte_mc.9.1

src_lte_mc.9.1:
	%vtpm.41 = alloca %D*
	%tmp.58 = bitcast %Object* %tmp.12 to %D*
	store %D* %tmp.58, %D** %vtpm.41
	%tmp.60 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.60, i32 4 )
	store %Int* %tmp.60, %Int** %tmp.18
	br label %case.exit.1

br_exit.9.1:
	br label %case.8.1

case.8.1:
	%vtpm.42 = icmp slt i32 %tmp.17, 8
	br i1 %vtpm.42, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.43 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.43, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%vtpm.44 = alloca %C*
	%tmp.61 = bitcast %Object* %tmp.12 to %C*
	store %C* %tmp.61, %C** %vtpm.44
	%tmp.63 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.63, i32 3 )
	store %Int* %tmp.63, %Int** %tmp.18
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.45 = icmp slt i32 %tmp.17, 7
	br i1 %vtpm.45, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.46 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.46, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.47 = alloca %B*
	%tmp.64 = bitcast %Object* %tmp.12 to %B*
	store %B* %tmp.64, %B** %vtpm.47
	%tmp.66 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.66, i32 2 )
	store %Int* %tmp.66, %Int** %tmp.18
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.48 = icmp slt i32 %tmp.17, 6
	br i1 %vtpm.48, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.49 = icmp sgt i32 %tmp.17, 22
	br i1 %vtpm.49, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%vtpm.50 = alloca %A*
	%tmp.67 = bitcast %Object* %tmp.12 to %A*
	store %A* %tmp.67, %A** %vtpm.50
	%tmp.69 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.69, i32 1 )
	store %Int* %tmp.69, %Int** %tmp.18
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.70 = load %Int*, %Int** %tmp.18
	%tmp.72 = getelementptr %Int, %Int* %tmp.70, i32 0, i32 1
	%tmp.71 = load i32, i32* %tmp.72
	store i32 %tmp.71, i32* %tmp.9
	%tmp.73 = load i32, i32* %tmp.1
	%tmp.74 = add i32 %tmp.73, 1
	store i32 %tmp.74, i32* %tmp.1
	br label %loop.0

false.0:
	%tmp.75 = alloca i32
	%tmp.76 = load i32, i32* %tmp.9
	%tmp.77 = icmp eq i32 %tmp.76, 17
	%tmp.78 = xor i1 %tmp.77, true
	br i1 %tmp.78, label %true.2, label %false.2

true.2:
	%tmp.79 = load i32, i32* %tmp.2
	%tmp.80 = add i32 %tmp.79, 1
	store i32 %tmp.80, i32* %tmp.2
	store i32 %tmp.80, i32* %tmp.75
	br label %end.2

false.2:
	store i32 0, i32* %tmp.75
	br label %end.2

end.2:
	%tmp.81 = load i32, i32* %tmp.75
	store i32 0, i32* %tmp.1
	br label %loop.3

loop.3:
	%tmp.82 = load i32, i32* %tmp.1
	%tmp.83 = icmp slt i32 %tmp.82, 10
	br i1 %tmp.83, label %true.3, label %false.3

true.3:
	%tmp.84 = load %Object*, %Object** %tmp.4
	%tmp.85 = icmp eq %Object* %tmp.84, null
	br i1 %tmp.85, label %abort, label %ok.1

ok.1:
	%tmp.86 = getelementptr %Object, %Object* %tmp.84, i32 0, i32 0
	%tmp.87 = load %Object_vtable*, %Object_vtable** %tmp.86
	%tmp.88 = getelementptr %Object_vtable, %Object_vtable* %tmp.87, i32 0, i32 0
	%tmp.89 = load i32, i32* %tmp.88
	br label %case.hdr.4

case.hdr.4:
	%tmp.90 = alloca %Int*
	br label %case.22.4

case.22.4:
	%vtpm.51 = icmp slt i32 %tmp.89, 22
	br i1 %vtpm.51, label %br_exit.22.4, label %src_gte_br.22.4

src_gte_br.22.4:
	%vtpm.52 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.52, label %br_exit.22.4, label %src_lte_mc.22.4

src_lte_mc.22.4:
	%vtpm.53 = alloca %Q*
	%tmp.91 = bitcast %Object* %tmp.84 to %Q*
	store %Q* %tmp.91, %Q** %vtpm.53
	%tmp.93 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.93, i32 17 )
	store %Int* %tmp.93, %Int** %tmp.90
	br label %case.exit.4

br_exit.22.4:
	br label %case.21.4

case.21.4:
	%vtpm.54 = icmp slt i32 %tmp.89, 21
	br i1 %vtpm.54, label %br_exit.21.4, label %src_gte_br.21.4

src_gte_br.21.4:
	%vtpm.55 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.55, label %br_exit.21.4, label %src_lte_mc.21.4

src_lte_mc.21.4:
	%vtpm.56 = alloca %P*
	%tmp.94 = bitcast %Object* %tmp.84 to %P*
	store %P* %tmp.94, %P** %vtpm.56
	%tmp.96 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.96, i32 16 )
	store %Int* %tmp.96, %Int** %tmp.90
	br label %case.exit.4

br_exit.21.4:
	br label %case.20.4

case.20.4:
	%vtpm.57 = icmp slt i32 %tmp.89, 20
	br i1 %vtpm.57, label %br_exit.20.4, label %src_gte_br.20.4

src_gte_br.20.4:
	%vtpm.58 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.58, label %br_exit.20.4, label %src_lte_mc.20.4

src_lte_mc.20.4:
	%vtpm.59 = alloca %O*
	%tmp.97 = bitcast %Object* %tmp.84 to %O*
	store %O* %tmp.97, %O** %vtpm.59
	%tmp.99 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.99, i32 15 )
	store %Int* %tmp.99, %Int** %tmp.90
	br label %case.exit.4

br_exit.20.4:
	br label %case.19.4

case.19.4:
	%vtpm.60 = icmp slt i32 %tmp.89, 19
	br i1 %vtpm.60, label %br_exit.19.4, label %src_gte_br.19.4

src_gte_br.19.4:
	%vtpm.61 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.61, label %br_exit.19.4, label %src_lte_mc.19.4

src_lte_mc.19.4:
	%vtpm.62 = alloca %N*
	%tmp.100 = bitcast %Object* %tmp.84 to %N*
	store %N* %tmp.100, %N** %vtpm.62
	%tmp.102 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.102, i32 14 )
	store %Int* %tmp.102, %Int** %tmp.90
	br label %case.exit.4

br_exit.19.4:
	br label %case.18.4

case.18.4:
	%vtpm.63 = icmp slt i32 %tmp.89, 18
	br i1 %vtpm.63, label %br_exit.18.4, label %src_gte_br.18.4

src_gte_br.18.4:
	%vtpm.64 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.64, label %br_exit.18.4, label %src_lte_mc.18.4

src_lte_mc.18.4:
	%vtpm.65 = alloca %M*
	%tmp.103 = bitcast %Object* %tmp.84 to %M*
	store %M* %tmp.103, %M** %vtpm.65
	%tmp.105 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.105, i32 13 )
	store %Int* %tmp.105, %Int** %tmp.90
	br label %case.exit.4

br_exit.18.4:
	br label %case.17.4

case.17.4:
	%vtpm.66 = icmp slt i32 %tmp.89, 17
	br i1 %vtpm.66, label %br_exit.17.4, label %src_gte_br.17.4

src_gte_br.17.4:
	%vtpm.67 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.67, label %br_exit.17.4, label %src_lte_mc.17.4

src_lte_mc.17.4:
	%vtpm.68 = alloca %L*
	%tmp.106 = bitcast %Object* %tmp.84 to %L*
	store %L* %tmp.106, %L** %vtpm.68
	%tmp.108 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.108, i32 12 )
	store %Int* %tmp.108, %Int** %tmp.90
	br label %case.exit.4

br_exit.17.4:
	br label %case.16.4

case.16.4:
	%vtpm.69 = icmp slt i32 %tmp.89, 16
	br i1 %vtpm.69, label %br_exit.16.4, label %src_gte_br.16.4

src_gte_br.16.4:
	%vtpm.70 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.70, label %br_exit.16.4, label %src_lte_mc.16.4

src_lte_mc.16.4:
	%vtpm.71 = alloca %K*
	%tmp.109 = bitcast %Object* %tmp.84 to %K*
	store %K* %tmp.109, %K** %vtpm.71
	%tmp.111 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.111, i32 11 )
	store %Int* %tmp.111, %Int** %tmp.90
	br label %case.exit.4

br_exit.16.4:
	br label %case.15.4

case.15.4:
	%vtpm.72 = icmp slt i32 %tmp.89, 15
	br i1 %vtpm.72, label %br_exit.15.4, label %src_gte_br.15.4

src_gte_br.15.4:
	%vtpm.73 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.73, label %br_exit.15.4, label %src_lte_mc.15.4

src_lte_mc.15.4:
	%vtpm.74 = alloca %J*
	%tmp.112 = bitcast %Object* %tmp.84 to %J*
	store %J* %tmp.112, %J** %vtpm.74
	%tmp.114 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.114, i32 10 )
	store %Int* %tmp.114, %Int** %tmp.90
	br label %case.exit.4

br_exit.15.4:
	br label %case.14.4

case.14.4:
	%vtpm.75 = icmp slt i32 %tmp.89, 14
	br i1 %vtpm.75, label %br_exit.14.4, label %src_gte_br.14.4

src_gte_br.14.4:
	%vtpm.76 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.76, label %br_exit.14.4, label %src_lte_mc.14.4

src_lte_mc.14.4:
	%vtpm.77 = alloca %I*
	%tmp.115 = bitcast %Object* %tmp.84 to %I*
	store %I* %tmp.115, %I** %vtpm.77
	%tmp.117 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.117, i32 9 )
	store %Int* %tmp.117, %Int** %tmp.90
	br label %case.exit.4

br_exit.14.4:
	br label %case.13.4

case.13.4:
	%vtpm.78 = icmp slt i32 %tmp.89, 13
	br i1 %vtpm.78, label %br_exit.13.4, label %src_gte_br.13.4

src_gte_br.13.4:
	%vtpm.79 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.79, label %br_exit.13.4, label %src_lte_mc.13.4

src_lte_mc.13.4:
	%vtpm.80 = alloca %H*
	%tmp.118 = bitcast %Object* %tmp.84 to %H*
	store %H* %tmp.118, %H** %vtpm.80
	%tmp.120 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.120, i32 8 )
	store %Int* %tmp.120, %Int** %tmp.90
	br label %case.exit.4

br_exit.13.4:
	br label %case.12.4

case.12.4:
	%vtpm.81 = icmp slt i32 %tmp.89, 12
	br i1 %vtpm.81, label %br_exit.12.4, label %src_gte_br.12.4

src_gte_br.12.4:
	%vtpm.82 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.82, label %br_exit.12.4, label %src_lte_mc.12.4

src_lte_mc.12.4:
	%vtpm.83 = alloca %G*
	%tmp.121 = bitcast %Object* %tmp.84 to %G*
	store %G* %tmp.121, %G** %vtpm.83
	%tmp.123 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.123, i32 7 )
	store %Int* %tmp.123, %Int** %tmp.90
	br label %case.exit.4

br_exit.12.4:
	br label %case.11.4

case.11.4:
	%vtpm.84 = icmp slt i32 %tmp.89, 11
	br i1 %vtpm.84, label %br_exit.11.4, label %src_gte_br.11.4

src_gte_br.11.4:
	%vtpm.85 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.85, label %br_exit.11.4, label %src_lte_mc.11.4

src_lte_mc.11.4:
	%vtpm.86 = alloca %F*
	%tmp.124 = bitcast %Object* %tmp.84 to %F*
	store %F* %tmp.124, %F** %vtpm.86
	%tmp.126 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.126, i32 6 )
	store %Int* %tmp.126, %Int** %tmp.90
	br label %case.exit.4

br_exit.11.4:
	br label %case.10.4

case.10.4:
	%vtpm.87 = icmp slt i32 %tmp.89, 10
	br i1 %vtpm.87, label %br_exit.10.4, label %src_gte_br.10.4

src_gte_br.10.4:
	%vtpm.88 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.88, label %br_exit.10.4, label %src_lte_mc.10.4

src_lte_mc.10.4:
	%vtpm.89 = alloca %E*
	%tmp.127 = bitcast %Object* %tmp.84 to %E*
	store %E* %tmp.127, %E** %vtpm.89
	%tmp.129 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.129, i32 5 )
	store %Int* %tmp.129, %Int** %tmp.90
	br label %case.exit.4

br_exit.10.4:
	br label %case.9.4

case.9.4:
	%vtpm.90 = icmp slt i32 %tmp.89, 9
	br i1 %vtpm.90, label %br_exit.9.4, label %src_gte_br.9.4

src_gte_br.9.4:
	%vtpm.91 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.91, label %br_exit.9.4, label %src_lte_mc.9.4

src_lte_mc.9.4:
	%vtpm.92 = alloca %D*
	%tmp.130 = bitcast %Object* %tmp.84 to %D*
	store %D* %tmp.130, %D** %vtpm.92
	%tmp.132 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.132, i32 4 )
	store %Int* %tmp.132, %Int** %tmp.90
	br label %case.exit.4

br_exit.9.4:
	br label %case.8.4

case.8.4:
	%vtpm.93 = icmp slt i32 %tmp.89, 8
	br i1 %vtpm.93, label %br_exit.8.4, label %src_gte_br.8.4

src_gte_br.8.4:
	%vtpm.94 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.94, label %br_exit.8.4, label %src_lte_mc.8.4

src_lte_mc.8.4:
	%vtpm.95 = alloca %C*
	%tmp.133 = bitcast %Object* %tmp.84 to %C*
	store %C* %tmp.133, %C** %vtpm.95
	%tmp.135 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.135, i32 3 )
	store %Int* %tmp.135, %Int** %tmp.90
	br label %case.exit.4

br_exit.8.4:
	br label %case.7.4

case.7.4:
	%vtpm.96 = icmp slt i32 %tmp.89, 7
	br i1 %vtpm.96, label %br_exit.7.4, label %src_gte_br.7.4

src_gte_br.7.4:
	%vtpm.97 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.97, label %br_exit.7.4, label %src_lte_mc.7.4

src_lte_mc.7.4:
	%vtpm.98 = alloca %B*
	%tmp.136 = bitcast %Object* %tmp.84 to %B*
	store %B* %tmp.136, %B** %vtpm.98
	%tmp.138 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.138, i32 2 )
	store %Int* %tmp.138, %Int** %tmp.90
	br label %case.exit.4

br_exit.7.4:
	br label %case.6.4

case.6.4:
	%vtpm.99 = icmp slt i32 %tmp.89, 6
	br i1 %vtpm.99, label %br_exit.6.4, label %src_gte_br.6.4

src_gte_br.6.4:
	%vtpm.100 = icmp sgt i32 %tmp.89, 22
	br i1 %vtpm.100, label %br_exit.6.4, label %src_lte_mc.6.4

src_lte_mc.6.4:
	%vtpm.101 = alloca %A*
	%tmp.139 = bitcast %Object* %tmp.84 to %A*
	store %A* %tmp.139, %A** %vtpm.101
	%tmp.141 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.141, i32 1 )
	store %Int* %tmp.141, %Int** %tmp.90
	br label %case.exit.4

br_exit.6.4:
	br label %abort

case.exit.4:
	%tmp.142 = load %Int*, %Int** %tmp.90
	%tmp.144 = getelementptr %Int, %Int* %tmp.142, i32 0, i32 1
	%tmp.143 = load i32, i32* %tmp.144
	store i32 %tmp.143, i32* %tmp.9
	%tmp.145 = load i32, i32* %tmp.1
	%tmp.146 = add i32 %tmp.145, 1
	store i32 %tmp.146, i32* %tmp.1
	br label %loop.3

false.3:
	%tmp.147 = alloca i32
	%tmp.148 = load i32, i32* %tmp.9
	%tmp.149 = icmp eq i32 %tmp.148, 1
	%tmp.150 = xor i1 %tmp.149, true
	br i1 %tmp.150, label %true.5, label %false.5

true.5:
	%tmp.151 = load i32, i32* %tmp.2
	%tmp.152 = add i32 %tmp.151, 1
	store i32 %tmp.152, i32* %tmp.2
	store i32 %tmp.152, i32* %tmp.147
	br label %end.5

false.5:
	store i32 0, i32* %tmp.147
	br label %end.5

end.5:
	%tmp.153 = load i32, i32* %tmp.147
	%tmp.154 = load i32, i32* %tmp.2
	%tmp.155 = load %Main*, %Main** %tmp.0
	%tmp.156 = icmp eq %Main* %tmp.155, null
	br i1 %tmp.156, label %abort, label %ok.2

ok.2:
	%tmp.157 = getelementptr %Main, %Main* %tmp.155, i32 0, i32 0
	%tmp.158 = load %Main_vtable*, %Main_vtable** %tmp.157
	%tmp.159 = getelementptr %Main_vtable, %Main_vtable* %tmp.158, i32 0, i32 8
	%tmp.160 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %tmp.159
	%tmp.161 = call %Main*(%Main*, i32) %tmp.160( %Main* %tmp.155, i32 %tmp.154 )
	%tmp.162 = load %Main*, %Main** %tmp.0
	%tmp.163 = bitcast %Main* %tmp.162 to %Object*
	ret %Object* %tmp.163

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.164 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.165 = load i32, i32* %tmp.164
	%tmp.166 = call i8*(i32) @malloc( i32 %tmp.165 )
	%tmp.167 = bitcast i8* %tmp.166 to %Main*
	%tmp.168 = getelementptr %Main, %Main* %tmp.167, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.168
	%tmp.169 = alloca %Main*
	store %Main* %tmp.167, %Main** %tmp.169
	ret %Main* %tmp.167

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
	ret %A* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%tmp.0 = getelementptr %B_vtable, %B_vtable* @B_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %B*
	%tmp.4 = getelementptr %B, %B* %tmp.3, i32 0, i32 0
	store %B_vtable* @B_vtable_prototype, %B_vtable** %tmp.4
	%tmp.5 = alloca %B*
	store %B* %tmp.3, %B** %tmp.5
	ret %B* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%tmp.0 = getelementptr %C_vtable, %C_vtable* @C_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %C*
	%tmp.4 = getelementptr %C, %C* %tmp.3, i32 0, i32 0
	store %C_vtable* @C_vtable_prototype, %C_vtable** %tmp.4
	%tmp.5 = alloca %C*
	store %C* %tmp.3, %C** %tmp.5
	ret %C* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %D* @D_new() {

entry:
	%tmp.0 = getelementptr %D_vtable, %D_vtable* @D_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %D*
	%tmp.4 = getelementptr %D, %D* %tmp.3, i32 0, i32 0
	store %D_vtable* @D_vtable_prototype, %D_vtable** %tmp.4
	%tmp.5 = alloca %D*
	store %D* %tmp.3, %D** %tmp.5
	ret %D* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %E* @E_new() {

entry:
	%tmp.0 = getelementptr %E_vtable, %E_vtable* @E_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %E*
	%tmp.4 = getelementptr %E, %E* %tmp.3, i32 0, i32 0
	store %E_vtable* @E_vtable_prototype, %E_vtable** %tmp.4
	%tmp.5 = alloca %E*
	store %E* %tmp.3, %E** %tmp.5
	ret %E* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %F* @F_new() {

entry:
	%tmp.0 = getelementptr %F_vtable, %F_vtable* @F_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %F*
	%tmp.4 = getelementptr %F, %F* %tmp.3, i32 0, i32 0
	store %F_vtable* @F_vtable_prototype, %F_vtable** %tmp.4
	%tmp.5 = alloca %F*
	store %F* %tmp.3, %F** %tmp.5
	ret %F* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %G* @G_new() {

entry:
	%tmp.0 = getelementptr %G_vtable, %G_vtable* @G_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %G*
	%tmp.4 = getelementptr %G, %G* %tmp.3, i32 0, i32 0
	store %G_vtable* @G_vtable_prototype, %G_vtable** %tmp.4
	%tmp.5 = alloca %G*
	store %G* %tmp.3, %G** %tmp.5
	ret %G* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %H* @H_new() {

entry:
	%tmp.0 = getelementptr %H_vtable, %H_vtable* @H_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %H*
	%tmp.4 = getelementptr %H, %H* %tmp.3, i32 0, i32 0
	store %H_vtable* @H_vtable_prototype, %H_vtable** %tmp.4
	%tmp.5 = alloca %H*
	store %H* %tmp.3, %H** %tmp.5
	ret %H* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %I* @I_new() {

entry:
	%tmp.0 = getelementptr %I_vtable, %I_vtable* @I_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %I*
	%tmp.4 = getelementptr %I, %I* %tmp.3, i32 0, i32 0
	store %I_vtable* @I_vtable_prototype, %I_vtable** %tmp.4
	%tmp.5 = alloca %I*
	store %I* %tmp.3, %I** %tmp.5
	ret %I* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %J* @J_new() {

entry:
	%tmp.0 = getelementptr %J_vtable, %J_vtable* @J_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %J*
	%tmp.4 = getelementptr %J, %J* %tmp.3, i32 0, i32 0
	store %J_vtable* @J_vtable_prototype, %J_vtable** %tmp.4
	%tmp.5 = alloca %J*
	store %J* %tmp.3, %J** %tmp.5
	ret %J* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %K* @K_new() {

entry:
	%tmp.0 = getelementptr %K_vtable, %K_vtable* @K_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %K*
	%tmp.4 = getelementptr %K, %K* %tmp.3, i32 0, i32 0
	store %K_vtable* @K_vtable_prototype, %K_vtable** %tmp.4
	%tmp.5 = alloca %K*
	store %K* %tmp.3, %K** %tmp.5
	ret %K* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %L* @L_new() {

entry:
	%tmp.0 = getelementptr %L_vtable, %L_vtable* @L_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %L*
	%tmp.4 = getelementptr %L, %L* %tmp.3, i32 0, i32 0
	store %L_vtable* @L_vtable_prototype, %L_vtable** %tmp.4
	%tmp.5 = alloca %L*
	store %L* %tmp.3, %L** %tmp.5
	ret %L* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %M* @M_new() {

entry:
	%tmp.0 = getelementptr %M_vtable, %M_vtable* @M_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %M*
	%tmp.4 = getelementptr %M, %M* %tmp.3, i32 0, i32 0
	store %M_vtable* @M_vtable_prototype, %M_vtable** %tmp.4
	%tmp.5 = alloca %M*
	store %M* %tmp.3, %M** %tmp.5
	ret %M* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %N* @N_new() {

entry:
	%tmp.0 = getelementptr %N_vtable, %N_vtable* @N_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %N*
	%tmp.4 = getelementptr %N, %N* %tmp.3, i32 0, i32 0
	store %N_vtable* @N_vtable_prototype, %N_vtable** %tmp.4
	%tmp.5 = alloca %N*
	store %N* %tmp.3, %N** %tmp.5
	ret %N* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %O* @O_new() {

entry:
	%tmp.0 = getelementptr %O_vtable, %O_vtable* @O_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %O*
	%tmp.4 = getelementptr %O, %O* %tmp.3, i32 0, i32 0
	store %O_vtable* @O_vtable_prototype, %O_vtable** %tmp.4
	%tmp.5 = alloca %O*
	store %O* %tmp.3, %O** %tmp.5
	ret %O* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %P* @P_new() {

entry:
	%tmp.0 = getelementptr %P_vtable, %P_vtable* @P_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %P*
	%tmp.4 = getelementptr %P, %P* %tmp.3, i32 0, i32 0
	store %P_vtable* @P_vtable_prototype, %P_vtable** %tmp.4
	%tmp.5 = alloca %P*
	store %P* %tmp.3, %P** %tmp.5
	ret %P* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

define %Q* @Q_new() {

entry:
	%tmp.0 = getelementptr %Q_vtable, %Q_vtable* @Q_vtable_prototype, i32 0, i32 1
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = call i8*(i32) @malloc( i32 %tmp.1 )
	%tmp.3 = bitcast i8* %tmp.2 to %Q*
	%tmp.4 = getelementptr %Q, %Q* %tmp.3, i32 0, i32 0
	store %Q_vtable* @Q_vtable_prototype, %Q_vtable** %tmp.4
	%tmp.5 = alloca %Q*
	store %Q* %tmp.3, %Q** %tmp.5
	ret %Q* %tmp.3

abort:
	call void @abort(  )
	unreachable
}

