//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully and add code to build an LLVM program 
//**************************************************************

#define EXTERN
#define MP3 1
#include "cgen.h"
#include <string>
#include <sstream>

// 
extern int cgen_debug;
int count = 0;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.  Feel free to add your
// own definitions as you see fit.
//
//////////////////////////////////////////////////////////////////////
EXTERN Symbol 
	// required classes
	Object,
	IO,
	String,
	Int,
	Bool,
	Main,

	// class methods
	cool_abort,
	type_name,
	cool_copy,
	out_string,
	out_int,
	in_string,
	in_int,
	length,
	concat,
	substr,

	// class members
	val,

	// special symbols
	No_class,    // symbol that can't be the name of any user-defined class
	No_type,     // If e : No_type, then no code is generated for e.
	SELF_TYPE,   // Special code is generated for new SELF_TYPE.
	self,        // self generates code differently than other references

	// extras
	arg,
	arg2,
	prim_string,
	prim_int,
	prim_bool;


//********************************************************
//
// PREDEFINED FUNCTIONS:
//
// The following functions are already coded, you should
// not need to modify them, although you may if necessary.
//
//********************************************************

//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
	Object      = idtable.add_string("Object");
	IO          = idtable.add_string("IO");
	String      = idtable.add_string("String");
	Int         = idtable.add_string("Int");
	Bool        = idtable.add_string("Bool");
	Main        = idtable.add_string("Main");

	cool_abort  = idtable.add_string("abort");
	type_name   = idtable.add_string("type_name");
	cool_copy   = idtable.add_string("copy");
	out_string  = idtable.add_string("out_string");
	out_int     = idtable.add_string("out_int");
	in_string   = idtable.add_string("in_string");
	in_int      = idtable.add_string("in_int");
	length      = idtable.add_string("length");
	concat      = idtable.add_string("concat");
	substr      = idtable.add_string("substr");

	val         = idtable.add_string("val");

	No_class    = idtable.add_string("_no_class");
	No_type     = idtable.add_string("_no_type");
	SELF_TYPE   = idtable.add_string("SELF_TYPE");
	self        = idtable.add_string("self");

	arg         = idtable.add_string("arg");
	arg2        = idtable.add_string("arg2");
	prim_string = idtable.add_string("sbyte*");
	prim_int    = idtable.add_string("int");
	prim_bool   = idtable.add_string("bool");
}

//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************
void program_class::cgen(ostream &os) 
{
	initialize_constants();
	class_table = new CgenClassTable(classes,os);
}


// Create definitions for all String constants
void StrTable::code_string_table(ostream& s, CgenClassTable* ct)
{
	for (List<StringEntry> *l = tbl; l; l = l->tl()) {
		l->hd()->code_def(s, ct);
	}
}

// Create definitions for all Int constants
void IntTable::code_string_table(ostream& s, CgenClassTable* ct)
{
	for (List<IntEntry> *l = tbl; l; l = l->tl()) {
		l->hd()->code_def(s, ct);
	}
}

//
// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP2.1
//
void CgenClassTable::setup_external_functions()
{
	ValuePrinter vp;
	// setup function: external int strcmp(sbyte*, sbyte*)
	op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
	vector<op_type> strcmp_args;
	strcmp_args.push_back(i8ptr_type);
	strcmp_args.push_back(i8ptr_type);	
	vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args); 

	// setup function: external int printf(sbyte*, ...)
	vector<op_type> printf_args;
	printf_args.push_back(i8ptr_type);
	printf_args.push_back(vararg_type);
	vp.declare(*ct_stream, i32_type, "printf", printf_args);

	// setup function: external void abort(void)
	op_type void_type(VOID);
	vector<op_type> abort_args;
	vp.declare(*ct_stream, void_type, "abort", abort_args);

	// setup function: external i8* malloc(i32)
	vector<op_type> malloc_args;
	malloc_args.push_back(i32_type);
	vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP3
	//ADD CODE HERE
	//Setup external functions for built in object class functions

	op_type objPtrType("Object", 1);
	op_type stringPtrType("String", 1);
	op_type IOPtrType("IO", 1);
	op_type intPtrType("Int", 1);
	op_type boolType(INT1);
	op_type boolPtrType("Bool", 1);
	op_type intType(INT32);
	vector<op_type> types;

	// Object_new
	vp.declare(*ct_stream, objPtrType, "Object_new", types);
	
	// Object_abort
	types.push_back(objPtrType);
	vp.declare(*ct_stream, objPtrType, "Object_abort", types);
	types.clear();

	// Object_type_name
	types.push_back(objPtrType);
	vp.declare(*ct_stream, stringPtrType, "Object_type_name", types);
	types.clear();

	// Object_copy
	types.push_back(objPtrType);
	vp.declare(*ct_stream, objPtrType, "Object_copy", types);
	types.clear();

	// IO_new
	vp.declare(*ct_stream, IOPtrType, "IO_new", types);
	types.clear();

	// IO_out_string
	types.push_back(IOPtrType);
	types.push_back(stringPtrType);
	vp.declare(*ct_stream, IOPtrType, "IO_out_string", types);
	types.clear();

	// IO_out_int
	types.push_back(IOPtrType);
	types.push_back(intType);
	vp.declare(*ct_stream, IOPtrType, "IO_out_int", types);
	types.clear();

	// IO_in_string
	types.push_back(IOPtrType);
	vp.declare(*ct_stream, stringPtrType, "IO_in_string", types);
	types.clear();

	// IO_in_int
	types.push_back(IOPtrType);
	vp.declare(*ct_stream, intType, "IO_in_int", types);
	types.clear();

	// String_new
	vp.declare(*ct_stream, stringPtrType, "String_new", types);

	// String_length
	types.push_back(stringPtrType);
	vp.declare(*ct_stream, intType, "String_length", types);
	types.clear();

	// String_concat
	types.push_back(stringPtrType);
	types.push_back(stringPtrType);
	vp.declare(*ct_stream, stringPtrType, "String_concat", types);
	types.clear();

	// String_substr
	types.push_back(stringPtrType);
	types.push_back(intType);
	types.push_back(intType);
	vp.declare(*ct_stream, stringPtrType, "String_substr", types);
	types.clear();

	// Int_new
	vp.declare(*ct_stream, intPtrType, "Int_new", types);

	// Int_init
	types.push_back(intPtrType);
	types.push_back(intType);
	vp.declare(*ct_stream, VOID, "Int_init", types);
	types.clear();

	// Bool_new
	vp.declare(*ct_stream, boolPtrType, "Bool_new", types);

	// Bool_init
	types.push_back(boolPtrType);
	types.push_back(boolType);
	vp.declare(*ct_stream, VOID, "Bool_init", types);
	types.clear();


#endif
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes()
{
	// The tree package uses these globals to annotate the classes built below.
	curr_lineno = 0;
	Symbol filename = stringtable.add_string("<basic class>");

	//
	// A few special class names are installed in the lookup table but not
	// the class list. Thus, these classes exist, but are not part of the
	// inheritance hierarchy.
	 
	// No_class serves as the parent of Object and the other special classes.
	Class_ noclasscls = class_(No_class,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
	delete noclasscls;

#ifdef MP3
	// SELF_TYPE is the self class; it cannot be redefined or inherited.
	Class_ selftypecls = class_(SELF_TYPE,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
	delete selftypecls;
	// 
	// Primitive types masquerading as classes. This is done so we can
	// get the necessary Symbols for the innards of String, Int, and Bool
	//
	Class_ primstringcls = class_(prim_string,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
	delete primstringcls;
#endif
	Class_ primintcls = class_(prim_int,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
	delete primintcls;
	Class_ primboolcls = class_(prim_bool,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
	delete primboolcls;
	// 
	// The Object class has no parent class. Its methods are
	//        cool_abort() : Object   aborts the program
	//        type_name() : Str       returns a string representation of class name
	//        copy() : SELF_TYPE      returns a copy of the object
	//
	// There is no need for method bodies in the basic classes---these
	// are already built in to the runtime system.
	//
	Class_ objcls =
		class_(Object, 
		       No_class,
		       append_Features(
		       append_Features(
		       single_Features(method(cool_abort, nil_Formals(), 
		                              Object, no_expr())),
		       single_Features(method(type_name, nil_Formals(),
		                              String, no_expr()))),
		       single_Features(method(cool_copy, nil_Formals(), 
		                              SELF_TYPE, no_expr()))),
		       filename);
	install_class(new CgenNode(objcls, CgenNode::Basic, this));
	delete objcls;

//
// The Int class has no methods and only a single attribute, the
// "val" for the integer. 
//
	Class_ intcls=
		class_(Int, 
		       Object,
		       single_Features(attr(val, prim_int, no_expr())),
		       filename);
	install_class(new CgenNode(intcls, CgenNode::Basic, this));
	delete intcls;

//
// Bool also has only the "val" slot.
//
	Class_ boolcls=
		class_(Bool,  
		       Object, 
		       single_Features(attr(val, prim_bool, no_expr())),
		       filename);
	install_class(new CgenNode(boolcls, CgenNode::Basic, this));
	delete boolcls;

#ifdef MP3
//
// The class String has a number of slots and operations:
//       val                                  the string itself
//       length() : Int                       length of the string
//       concat(arg: Str) : Str               string concatenation
//       substr(arg: Int, arg2: Int): Str     substring
//       
	Class_ stringcls =
		class_(String, 
		       Object,
		       append_Features(
		       append_Features(
		       append_Features(
		       single_Features(attr(val, prim_string, no_expr())),
		       single_Features(method(length, nil_Formals(),
		                              Int, no_expr()))),
		       single_Features(method(concat,
		                              single_Formals(formal(arg, String)),
		                              String,
		                              no_expr()))),
		       single_Features(method(substr, 
		                              append_Formals(
		                                 single_Formals(formal(arg, Int)), 
		                                 single_Formals(formal(arg2, Int))),
		                              String, 
		                              no_expr()))),
		       filename);
	install_class(new CgenNode(stringcls, CgenNode::Basic, this));
	delete stringcls;
#endif

#ifdef MP3
// 
// The IO class inherits from Object. Its methods are
//        out_string(Str) : SELF_TYPE          writes a string to the output
//        out_int(Int) : SELF_TYPE               "    an int    "  "     "
//        in_string() : Str                    reads a string from the input
//        in_int() : Int                         "   an int     "  "     "
//
	Class_ iocls =
		class_(IO,
		       Object,
		       append_Features(
		       append_Features(
		       append_Features(
		       single_Features(method(out_string,
		                              single_Formals(formal(arg, String)),
		                              SELF_TYPE, no_expr())),
		       single_Features(method(out_int, single_Formals(formal(arg, Int)),
		                              SELF_TYPE, no_expr()))),
		       single_Features(method(in_string, nil_Formals(), String,
		                              no_expr()))),
		       single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
		       filename);
	install_class(new CgenNode(iocls, CgenNode::Basic, this));
	delete iocls;
#endif
}

//
// install_classes enters a list of classes in the symbol table.
//
void CgenClassTable::install_classes(Classes cs)
{
	for (int i = cs->first(); cs->more(i); i = cs->next(i)) {
		install_class(new CgenNode(cs->nth(i),CgenNode::NotBasic,this));
	}
}

// 
// Add this CgenNode to the class list and the lookup table
// 
void CgenClassTable::install_class(CgenNode *nd)
{
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of classes
	// and the symbol table.
	nds = new List<CgenNode>(nd,nds);
	addid(name,nd);
}

// 
// Add this CgenNode to the special class list and the lookup table
// 
void CgenClassTable::install_special_class(CgenNode *nd)
{
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of special classes
	// and the symbol table.
	special_nds = new List<CgenNode>(nd, special_nds);
	addid(name,nd);
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree()
{
	for(List<CgenNode> *l = nds; l; l = l->tl())
		set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd)
{
	CgenNode *parent_node = probe(nd->get_parent());
	nd->set_parentnd(parent_node);
	parent_node->add_child(nd);
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root()
{
	return probe(Object);
}

//////////////////////////////////////////////////////////////////////
//
// Special-case functions used for the method Int Main::main() for
// MP2-1 only.
//
//////////////////////////////////////////////////////////////////////

#ifndef MP3

CgenNode* CgenClassTable::getMainmain(CgenNode* c)
{
	if (c && ! c->basic())
		return c;                   // Found it!

	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl()) {
		if (CgenNode* foundMain = this->getMainmain(child->hd()))
			return foundMain;   // Propagate it up the recursive calls
	}

	return 0;                           // Make the recursion continue
}

#endif

//-------------------------------------------------------------------
//
// END OF PREDEFINED FUNCTIONS
//
//-------------------------------------------------------------------


///////////////////////////////////////////////////////////////////////////////
//
// coding string, int, and boolean constants
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type stringEntry.  stringEntry methods are defined both for string
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Create global definitions for constant Cool objects
//
void CgenClassTable::code_constants()
{
#ifdef MP3
	CgenEnvironment* env = new CgenEnvironment(*(this->ct_stream), root());
	ValuePrinter vp(*(env->cur_stream));

	// Find number of string constants
	int numConsts;
	for (numConsts = stringtable.first(); stringtable.more(numConsts); numConsts = stringtable.next(numConsts)) {
		// Do nothing, just need number
	}

	// Initialize string constants in reverse order to match reference
	for (int i = numConsts - 1; i >= stringtable.first(); i--) {
		Symbol currString = stringtable.lookup(i);
		// Create LLVM constant
		op_arr_type stringArray(INT8, string(currString->get_string()).length() + 1);
		const_value stringConst(stringArray, string(currString->get_string()), true);
		string stringName = "str." + std::to_string(i);
		vp.init_constant(stringName, stringConst);

		// Create object layout
		op_type ptrType(INT8_PTR);
		op_type stringType("String");
		op_type stringVtableType("String_vtable", 1);
		vector<op_type> stringVtableTypes;
		vector<const_value> stringVtableValues;

		// Create vtable values for string object
		stringVtableTypes.push_back(stringVtableType);
		stringVtableTypes.push_back(ptrType);
		const_value stringVtableProtoConst(stringVtableType, "@String_vtable_prototype", false);
		stringVtableValues.push_back(stringVtableProtoConst);
		string getElementPtrName = "@" + stringName;
		const_value getElementPtrConst(stringArray, getElementPtrName, false);
		stringVtableValues.push_back(getElementPtrConst);
		string structName = "String." + std::to_string(i);
		global_value structValue(stringType, structName);

		vp.init_struct_constant(structValue, stringVtableTypes, stringVtableValues);
	}
#endif
}

// generate code to define a global string constant
void StringEntry::code_def(ostream& s, CgenClassTable* ct)
{
#ifdef MP3
	// ADD CODE HERE
#endif
}

// generate code to define a global int constant
void IntEntry::code_def(ostream& s, CgenClassTable* ct)
{
	// Leave this method blank, since we are not going to use global
	// declarations for int constants.
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//
// CgenClassTable constructor orchestrates all code generation
//
CgenClassTable::CgenClassTable(Classes classes, ostream& s) 
: nds(0)
{
	if (cgen_debug) std::cerr << "Building CgenClassTable" << endl;
	ct_stream = &s;
	// Make sure we have a scope, both for classes and for constants
	enterscope();
	if (cgen_debug) std::cerr << "Done with enterscope" << endl;

	// Create an inheritance tree with one CgenNode per class.
	install_basic_classes();
	if (cgen_debug) std::cerr << "Done with install_basic_classes" << endl;
	install_classes(classes);
	if (cgen_debug) std::cerr << "Done with install_classes" << endl;
	build_inheritance_tree();
	if (cgen_debug) std::cerr << "Done with build_inheritance_tree" << endl;

	// First pass
	setup();
	if (cgen_debug) std::cerr << "Done with setup" << endl;

	// Second pass
	code_module();
	if (cgen_debug) std::cerr << "Done with code_module" << endl;
	// Done with code generation: exit scopes
	exitscope();

}

CgenClassTable::~CgenClassTable()
{
}

// The code generation first pass.  Define these two functions to traverse
// the tree and setup each CgenNode
void CgenClassTable::setup()
{
	setup_external_functions();
	setup_classes(root(), 0);
}


void CgenClassTable::setup_classes(CgenNode *c, int depth)
{
	// MAY ADD CODE HERE
	// if you want to give classes more setup information

	c->setup(current_tag++, depth);
	if (cgen_debug) std::cerr << "Done with class setup" << endl;
	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
		setup_classes(child->hd(), depth + 1);
	
	c->set_max_child(current_tag-1);

	
	if (cgen_debug)
		std::cerr << "Class " << c->get_name() << " assigned tag " 
			<< c->get_tag() << ", max child " << c->get_max_child() 
			<< ", depth " << depth << endl;
	
}


// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module()
{
	code_constants();
	if (cgen_debug) std::cerr << "done with code_constants()" << endl;

#ifndef MP3
	// This must be after code_module() since that emits constants
	// needed by the code() method for expressions
	CgenNode* mainNode = getMainmain(root());
	mainNode->codeGenMainmain(*ct_stream);
#endif
	code_main();

#ifdef MP3
	code_classes(root());
#else
#endif
}


#ifdef MP3
void CgenClassTable::code_classes(CgenNode *c)
{

	c->code_class();
	List<CgenNode>* children = c->get_children();
	for (List<CgenNode>* child = children; child; child = child->tl()) {
		code_classes(child->hd());
	}

}
#endif


//
// Create LLVM entry point. This function will initiate our Cool program 
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
	ValuePrinter vp(*ct_stream);

	// Define return type of main
	op_type i32_type(INT32);
	// string returned from Main.main()
	string returnString("Main.main() returned %d\n");
	// Need to save the operand type to create a constant
	op_arr_type returnStringType(INT8, returnString.length()+1);
	// Need to convert returnString to const_value in order
	// to call init_constant
	const_value constReturnString(returnStringType, returnString, true);
	// Initialize string as constant
	//vp.init_constant("main.printout.str", constReturnString);

	// Create an empty vector of operands since main has no parameters
	vector<operand> mainArgs;
	// Define main function that returns an int
	vp.define(i32_type, "main", mainArgs);

	// Create an empty vector of op_types in order to use vp.call()
	vector<op_type> mainTypes;

	// Define an entry basic block
	string entryBlockName("entry");
	vp.begin_block(entryBlockName);
	// Call Main_new(), which returns %Main*
	//operand result = vp.call(mainTypes, i32_type, "Main_main", true, mainArgs);

	op_type noOpType;
	operand noOp;
	op_type mainType("Main", 1);
	op_type objectType("Object", 1);
	mainArgs.clear();
	vector<op_type> mainArgsTypes;
	operand mainOp(mainType, "main.obj");

	mainArgsTypes.push_back(noOpType);
	mainArgs.push_back(noOp);

	vp.call(*ct_stream, mainArgsTypes, "Main_new", true, mainArgs, mainOp);

	// Call Main_main()
	operand mainReturnOp(mainType, "main.retval");
	vector<operand> mainReturnArgs;
	vector<op_type> mainReturnTypes;
	mainReturnArgs.push_back(mainOp);
	mainReturnTypes.push_back(mainType);

	vp.call(*ct_stream, mainReturnTypes, "Main_main", true, mainReturnArgs, mainReturnOp);

	// Return 0
	int_value zeroOp(0);
	vp.ret(zeroOp);


#ifndef MP3

	// Create ptr type for string to use in printf
	op_arr_ptr_type returnStringTypePtr(INT8, returnString.length()+1);
	// Need to convert string to global_value for use by
	// vp.getelementptr
	global_value returnStringPtr(returnStringTypePtr, "main.printout.str", constReturnString);
	// Create variable for result type
	op_type resultType(INT8_PTR);
	// Call getelementptr, return into resultPtr
	operand resultPtr(resultType, "tpm");
	vp.getelementptr(*ct_stream, returnStringType, returnStringPtr, int_value(0), int_value(0), resultPtr);

	// Create args and arg types variables for printf
	vector<operand> printfArgs;
	vector<op_type> printfTypes;
	// Add args and arg_types to variables
	// First need to create var for type VAR_ARG
	op_type varArg(VAR_ARG);
	printfTypes.push_back(resultType);
	printfTypes.push_back(varArg);
	printfArgs.push_back(resultPtr);
	printfArgs.push_back(result);
	//Call print, return into printfResult
	operand printfResult = vp.call(printfTypes, i32_type, "printf", true, printfArgs);

	// return 0
	vp.ret(int_value(0));

#else
	
#endif
	// Close the vp.define call
	vp.end_define();

}


///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTable *ct)
: class__class((const class__class &) *nd), 
  parentnd(0), children(0), basic_status(bstatus), class_table(ct), tag(-1)
{ 
	// ADD CODE HERE
}

void CgenNode::add_child(CgenNode *n)
{
	children = new List<CgenNode>(n,children);
}

void CgenNode::set_parentnd(CgenNode *p)
{
	assert(parentnd == NULL);
	assert(p != NULL);
	parentnd = p;
}

op_type CgenNode::get_ret_type(string s, bool isFormal)
{
	if (s == "Bool" || s == "bool") {
		return INT1;
	} else if (s == "Int" || s == "int") {
		return INT32;
	} else if (s == "SELF_TYPE") {
		op_type result(this->get_type_name());
		return result;
	} 

	if (!isFormal) {
		s += "*";
	}
	op_type result(s);
	return result;
}

op_type CgenNode::get_ret_type_ptr(string s)
{
	if (s == "Bool" || s == "bool") {
		return INT1_PTR;
	} else if (s == "Int" || s == "int") {
		return INT32_PTR;
	} else if (s == "String") {
		return INT8_PTR;
	} else if (s == "SELF_TYPE") {
		op_type result(this->get_type_name());
		return result;
	} 

	op_type result(s, 1);
	return result;
}

bool CgenNode::check_basic(string s, bool checkSelfType)
{
	if (s == "Object" ||
		s == "Int" || 
		s == "Bool" ||
		s == "IO" ||
		s == "String") {
		return true;
	}

	if (checkSelfType && s == "SELF_TYPE") {
		return true;
	}

	return false;
}

bool CgenNode::check_basic_type(string s, bool checkSelfType)
{
	if (s == "i1" ||
		s == "i32" || 
		s == "i8*" )
	{
		return true;
	}

	if (checkSelfType && s == "SELF_TYPE") {
		return true;
	}

	return false;
}

op_type get_method_type(string s)
{
	if (s == "Bool" || s == "bool") {
		return INT1;
	} else if (s == "Int" || s == "int") {
		return INT32;
	} else if (s == "String") {
		return INT8_PTR;
	}

	return op_type(s, 1);
}

string simplify_name(string s)
{
	int ct = 0;
	for (int i = 0; i < s.length(); i++) {
		if (s.at(i) == '_') {
			ct++;
			break;
		} else {
			ct++;
		}
	}
	return s.substr(ct);
}

void CgenNode::init_defaults()
{
	// Generate vtable types common to all vtables
	this->vtableTypes.push_back(op_type(INT32));
	this->vtableTypes.push_back(op_type(INT32));
	this->vtableTypes.push_back(op_type(INT8_PTR));
	string nameType = string(name->get_string()) + "* () ";
	this->vtableTypes.push_back(op_type(nameType, 1));

	// Generate vtable entries common to all vtables
	this->vtableValues.push_back(const_value(op_type(INT32), std::to_string(count++), false));
	string ptrToIntName = "ptrtoint (%" + this->get_type_name() + "* getelementptr (%" + this->get_type_name() + ", %" + this->get_type_name() + "* null, i32 1) to i32)";
	this->vtableValues.push_back(const_value(op_type(INT32), ptrToIntName, false));
	int getElementPtrNameLen = (int)(this->get_type_name().length() + 1);
	string getElementPtrName = "getelementptr ([" + std::to_string(getElementPtrNameLen) + " x i8], [" + std::to_string(getElementPtrNameLen) +  " x i8]* @str." + this->get_type_name() + ", i32 0, i32 0)";
	this->vtableValues.push_back(const_value(op_type(INT8_PTR), getElementPtrName, false));
	string newClassName = "@" + this->get_type_name() + "_new";
	this->vtableValues.push_back(const_value(op_type(nameType, 1), newClassName, false));

	// Generate vtable func names common to all vtables
	this->vtableFuncNames.push_back("counter");
	this->vtableFuncNames.push_back("ptrtoint");
	this->vtableFuncNames.push_back("getelementptr");
	this->vtableFuncNames.push_back("_new");
	this->vtableFuncNames.push_back("abort");
	this->vtableFuncNames.push_back("type_name");
	this->vtableFuncNames.push_back("copy");

	// Generate default vtable entries for this->get_type_name()
	if (this->get_type_name() == "Object") {
		// Generate vtable types common to Object classes
		// Object_abort
		op_type objectType("Object", 1);
		vector<op_type> objectArgs;
		objectArgs.push_back(objectType);
		op_func_type objectAbortPtr(objectType, objectArgs);
		this->vtableTypes.push_back(objectAbortPtr);
		objectArgs.clear();

		// Object_type_name
		op_type stringType("String", 1);
		objectArgs.push_back(objectType);
		op_func_type objectTypeNamePtr(stringType, objectArgs);
		this->vtableTypes.push_back(objectTypeNamePtr);
		objectArgs.clear();

		// Object_copy
		objectArgs.push_back(objectType);
		op_func_type objectCopyPtr(objectType, objectArgs);
		this->vtableTypes.push_back(objectCopyPtr);
		objectArgs.clear();

		// Generate vtable values common to Object classes
		// Object_abort
		string objectAbortName = "@" + this->get_type_name() + "_abort";
		const_value objectAbortValue(op_type(nameType, 1), objectAbortName, false);
		this->vtableValues.push_back(objectAbortValue);

		// Object_type_name
		string objectTypeNameName = "@" + this->get_type_name() + "_type_name";
		const_value objectTypeNameValue(op_type(nameType, 1), objectTypeNameName, false);
		this->vtableValues.push_back(objectTypeNameValue);

		// Object_copy
		string objectCopyName = "@" + this->get_type_name() + "_copy";
		const_value objectCopyValue(op_type(nameType, 1), objectCopyName, false);
		this->vtableValues.push_back(objectCopyValue);

	} else {
		// Create vtable types for bitcasted functions inherited from Object
		string typeName = name->get_string();
		if (typeName == "SELF_TYPE") {
			typeName = this->get_type_name();
		}
		vector<op_type> selfArgs;
		op_type objectType("Object", 1);
		op_type stringType("String", 1);
		op_type selfType(typeName, 1);

		// SELF_TYPE_abort
		selfArgs.push_back(selfType);
		op_func_type selfAbortPtr(objectType, selfArgs);
		this->vtableTypes.push_back(selfAbortPtr);
		selfArgs.clear();

		// SELF_TYPE_type_name
		selfArgs.push_back(selfType);
		op_func_type selfTypeNamePtr(stringType, selfArgs);
		this->vtableTypes.push_back(selfTypeNamePtr);
		selfArgs.clear();

		// SELF_TYPE_copy
		selfArgs.push_back(selfType);
		op_func_type selfCopyPtr(selfType, selfArgs);
		this->vtableTypes.push_back(selfCopyPtr);
		selfArgs.clear();

		// Create vtable values for bitcasted functions inherited from Object
		// SELF_TYPE_abort
		string selfAbortName = "bitcast (%Object* (%Object*) * @Object_abort to %Object* (%" + typeName + "*) *)";
		const_value selfAbortValue(op_type(nameType, 1), selfAbortName, false);
		this->vtableValues.push_back(selfAbortValue);

		// SELF_TYPE_type_name
		string selfTypeNameName = "bitcast (%String* (%Object*) * @Object_type_name to %String* (%" + typeName + "*) *)";
		const_value selfTypeNameValue(op_type(nameType, 1), selfTypeNameName, false);
		this->vtableValues.push_back(selfTypeNameValue);

		// SELF_TYPE_copy
		string selfCopyName = "bitcast (%Object* (%Object*) * @Object_copy to %"+ typeName + "* (%" + typeName + "*) *)";
		const_value selfCopyValue(op_type(nameType, 1), selfCopyName, false);
		this->vtableValues.push_back(selfCopyValue);
	}

	// Generate vtable entries for IO functions
	if (this->get_type_name() == "IO") {
		// Create vtable types for IO functions
		op_type IOType("IO", 1);
		op_type stringType("String", 1);
		op_type intType(INT32);
		vector<op_type> IOArgs;

		// IO_out_string
		IOArgs.push_back(IOType);
		IOArgs.push_back(stringType);
		op_func_type IOOutStringPtr(IOType, IOArgs);
		this->vtableTypes.push_back(IOOutStringPtr);
		IOArgs.clear();

		// IO_out_int
		IOArgs.push_back(IOType);
		IOArgs.push_back(intType);
		op_func_type IOOutIntPtr(IOType, IOArgs);
		this->vtableTypes.push_back(IOOutIntPtr);
		IOArgs.clear();

		// IO_in_string
		IOArgs.push_back(IOType);
		op_func_type IOInStringPtr(stringType, IOArgs);
		this->vtableTypes.push_back(IOInStringPtr);
		IOArgs.clear();

		// IO_in_int
		IOArgs.push_back(IOType);
		op_func_type IOInIntPtr(intType, IOArgs);
		this->vtableTypes.push_back(IOInIntPtr);
		IOArgs.clear();

		// Create vtable values for IO functions
		// IO_out_string
		string IOOutStringName = "@" + this->get_type_name() + "_out_string";
		const_value IOOutStringValue(op_type(nameType, 1), IOOutStringName, false);
		this->vtableValues.push_back(IOOutStringValue);

		// IO_out_int
		string IOOutIntName = "@" + this->get_type_name() + "_out_int";
		const_value IOOutIntValue(op_type(nameType, 1), IOOutIntName, false);
		this->vtableValues.push_back(IOOutIntValue);

		// IO_in_string
		string IOInStringName = "@" + this->get_type_name() + "_in_string";
		const_value IOInStringValue(op_type(nameType, 1), IOInStringName, false);
		this->vtableValues.push_back(IOInStringValue);

		// IO_in_int
		string IOInIntName = "@" + this->get_type_name() + "_in_int";
		const_value IOInIntValue(op_type(nameType, 1), IOInIntName, false);
		this->vtableValues.push_back(IOInIntValue); 

		// Generate vtable func names for IO functions
		this->vtableFuncNames.push_back("out_string");
		this->vtableFuncNames.push_back("out_int");
		this->vtableFuncNames.push_back("in_string");
		this->vtableFuncNames.push_back("in_int");
	}

	// Generate vtable entries for String functions
	if (this->get_type_name() == "String") {
		// Create vtable types for String functions
		op_type stringType("String", 1);
		op_type intType(INT32);
		vector<op_type> stringArgs;

		// String_length
		stringArgs.push_back(stringType);
		op_func_type stringLengthPtr(intType, stringArgs);
		this->vtableTypes.push_back(stringLengthPtr);
		stringArgs.clear();

		// String_concat
		stringArgs.push_back(stringType);
		stringArgs.push_back(stringType);
		op_func_type stringConcatPtr(stringType, stringArgs);
		this->vtableTypes.push_back(stringConcatPtr);
		stringArgs.clear();

		// String_substr
		stringArgs.push_back(stringType);
		stringArgs.push_back(intType);
		stringArgs.push_back(intType);
		op_func_type stringSubstrPtr(stringType, stringArgs);
		this->vtableTypes.push_back(stringSubstrPtr);
		stringArgs.clear();

		// Create vtable values for String functions
		// String_length
		string stringLengthName = "@" + this->get_type_name() + "_length";
		const_value stringLengthValue(op_type(nameType, 1), stringLengthName, false);
		this->vtableValues.push_back(stringLengthValue);

		// String_concat
		string stringConcatName = "@" + this->get_type_name() + "_concat";
		const_value stringConcatValue(op_type(nameType, 1), stringConcatName, false);
		this->vtableValues.push_back(stringConcatValue);

		// String_substr
		string stringSubstrName = "@" + this->get_type_name() + "_substr";
		const_value stringSubstrValue(op_type(nameType, 1), stringSubstrName, false);
		this->vtableValues.push_back(stringSubstrValue);

		// Generate vtable func names for String functions
		this->vtableFuncNames.push_back("length");
		this->vtableFuncNames.push_back("concat");
		this->vtableFuncNames.push_back("substr");
	}
}

void CgenNode::handle_inheritance()
{
	CgenEnvironment *env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);
	ValuePrinter vp(*(env->cur_stream));

	// Generate vtable entries for inherited functions
	string nameValue = string(name->get_string()) + "* () ";
	op_type nameType(nameValue, 1);
	string typeName = name->get_string();
	if (typeName == "SELF_TYPE") {
		typeName = this->get_type_name();
	}
	string parentTypeName = this->get_parentnd()->name->get_string();
	if (parentTypeName == "SELF_TYPE") {
		parentTypeName = this->get_parentnd()->get_type_name();
	}

	if (this->get_parentnd()->basic()) {
		// Generate vtable entries for inherited functions from basic parent class
		if (this->get_parentnd()->get_type_name() == "IO") {
			op_type stringType("String", 1);
			op_type intType(INT32);
			op_type selfType(string(name->get_string()), 1);
			vector<op_type> IOArgs;
			vector<op_type> vtableInheritedTypes;

			// SELF_TYPE methods
			// IO_out_string
			IOArgs.push_back(selfType);
			IOArgs.push_back(stringType);
			op_func_type IOOutStringPtr(selfType, IOArgs);
			this->vtableTypes.push_back(IOOutStringPtr);
			IOArgs.clear();

			// IO_out_int
			IOArgs.push_back(selfType);
			IOArgs.push_back(intType);
			op_func_type IOOutIntPtr(selfType, IOArgs);
			this->vtableTypes.push_back(IOOutIntPtr);
			IOArgs.clear();

			// IO_in_string
			IOArgs.push_back(selfType);
			op_func_type IOInStringPtr(stringType, IOArgs);
			this->vtableTypes.push_back(IOInStringPtr);
			IOArgs.clear();

			// IO_in_int
			IOArgs.push_back(selfType);
			op_func_type IOInIntPtr(intType, IOArgs);
			this->vtableTypes.push_back(IOInIntPtr);
			IOArgs.clear(); 

			// Generate vtable func names for IO functions
			this->vtableFuncNames.push_back("out_string");
			this->vtableFuncNames.push_back("out_int");
			this->vtableFuncNames.push_back("in_string");
			this->vtableFuncNames.push_back("in_int");

			// Generate vtable types for inherited IO functions
			// IO_out_string
			IOArgs.push_back(selfType);
			IOArgs.push_back(stringType);
			op_func_type inheritedOutStringPtr(selfType, IOArgs);
			vtableInheritedTypes.push_back(inheritedOutStringPtr);
			IOArgs.clear();

			// IO_out_int
			IOArgs.push_back(selfType);
			IOArgs.push_back(intType);
			op_func_type inheritedOutIntPtr(selfType, IOArgs);
			vtableInheritedTypes.push_back(inheritedOutIntPtr);
			IOArgs.clear();

			// IO_in_string
			IOArgs.push_back(selfType);
			op_func_type inheritedInStringPtr(stringType, IOArgs);
			vtableInheritedTypes.push_back(inheritedInStringPtr);
			IOArgs.clear();

			// IO_in_int
			IOArgs.push_back(selfType);
			op_func_type inheritedInIntPtr(intType, IOArgs);
			vtableInheritedTypes.push_back(inheritedInIntPtr);
			IOArgs.clear();

			// Generate vtable values for inherited IO functions
			// IO_out_string
			string inheritedOutStringName = "bitcast (%IO* (%IO*,%String*) * @IO_out_string to " + selfType.get_name() + " (" + selfType.get_name() + ",%String*) *)";
			const_value inheritedOutStringValue(nameType, inheritedOutStringName, false);
			this->vtableValues.push_back(inheritedOutStringValue);

			// IO_out_int
			string inheritedOutIntName = "bitcast (%IO* (%IO*,i32) * @IO_out_int to " + selfType.get_name() + " (" + selfType.get_name() + ",i32) *)";
			const_value inheritedOutIntValue(nameType, inheritedOutIntName, false);
			this->vtableValues.push_back(inheritedOutIntValue);

			// IO_in_string
			string inheritedInStringName = "bitcast (%String* (%IO*) * @IO_in_string to %String* (" + selfType.get_name() + ") *)";
			const_value inheritedInStringValue(nameType, inheritedInStringName, false);
			this->vtableValues.push_back(inheritedInStringValue);

			// IO_in_int
			string inheritedInIntName = "bitcast (i32 (%IO*) * @IO_in_int to i32 (" + selfType.get_name() + ") *)";
			const_value inheritedInIntValue(nameType, inheritedInIntName, false);
			this->vtableValues.push_back(inheritedInIntValue);

		}
	} else {
		// Generate vtable entries for inherited functions from non-basic parent
		int offset = 0;
		for (auto i = 0; i < this->get_parentnd()->myVtableTypes.size(); i++) {
			op_type selfType(typeName, 1);
			op_type returnType;
			if (this->get_parentnd()->myVtableReturnTypes.at(i) == "i1") {
				returnType = op_type(INT1);
			} else if (this->get_parentnd()->myVtableReturnTypes.at(i) == "i32") {
				returnType = op_type(INT32);
			} else {
				returnType = op_type(this->get_parentnd()->myVtableReturnTypes.at(i));
			}
			if (cgen_debug) std::cerr << "return type:" << returnType.get_name() << endl;
			vector<op_type> inheritedArgs;
			string inheritedArgsNames;

			// Generate vtable type
			inheritedArgs.push_back(selfType);
			inheritedArgsNames += typeName;
			for (int j = 0; j < this->get_parentnd()->numFormalOps.at(i); j++) {
				inheritedArgs.push_back(this->get_parentnd()->formalOps.at(offset).get_type());
				inheritedArgsNames += "," + this->get_parentnd()->formalOps.at(offset).get_type().get_name();
				offset++;
			}
			op_func_type inheritedFuncPtr(returnType, inheritedArgs);
			this->vtableTypes.push_back(inheritedFuncPtr);

			// Generate vtable value
			string inheritedValueName = "bitcast (" + returnType.get_name();
			inheritedValueName += " (%" + parentTypeName + "*) * " + this->get_parentnd()->myVtableValues.at(i).get_name();
			inheritedValueName += " to " + returnType.get_name() + " (%" + inheritedArgsNames + "*) *)";
			const_value inheritedValue(INT32, inheritedValueName, false);
			this->vtableValues.push_back(inheritedValue);
			this->vtableFuncNames.push_back(simplify_name(this->get_parentnd()->myVtableValues.at(i).get_name()));
		}
	}

}

//
// Class setup.  You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).  
// 
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::setup(int tag, int depth)
{
	this->tag = tag;
#ifdef MP3
	init_defaults();
	layout_features();

	ValuePrinter vp(*(this->get_classtable()->ct_stream));

	// Create string constant for class name
	string selfName = this->name->get_string();
	op_arr_type selfNameArr(INT8, selfName.length() + 1);
	const_value selfNameConst(selfNameArr, selfName, true);
	vp.init_constant("str." + string(this->name->get_string()), selfNameConst);

	// Check if we need to handle inheritance
	if (!this->basic()) {
		// Fill vtable with inherited entries first
		this->handle_inheritance();
		// Add vtable entries discovered during layout_features()
		for (auto i = 0; i < this->myVtableTypes.size(); i++) {
			vtableTypes.push_back(this->myVtableTypes.at(i));
			vtableValues.push_back(this->myVtableValues.at(i));
		}
	}

	// Create vtables
	op_type vtableType(string(name->get_string()) + "_vtable", 1);
	vector<op_type> classMembers;
	classMembers.push_back(vtableType);
	for (auto i = 0; i < myVtableAttrTypes.size(); i++) {
		classMembers.push_back(myVtableAttrTypes.at(i));
	}
	vp.type_define(name->get_string(), classMembers);
	vp.type_define(string(name->get_string()) + "_vtable", this->vtableTypes);

	op_type vtableProtoType(string(name->get_string()) + "_vtable");
	global_value vtableProtoValue(vtableProtoType, string(name->get_string()) + "_vtable_prototype");
	vp.init_struct_constant(vtableProtoValue, this->vtableTypes, this->vtableValues);


#endif
}

#ifdef MP3
//
// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
//
void CgenNode::code_class()
{
	// No code generation for basic classes. The runtime will handle that.
	if (basic())
		return;
	
	CgenEnvironment* env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);
	ValuePrinter vp(*(env->cur_stream));

	// Generate code for class methods (attributes done later)
	env->skipAttr = true;
	int i = features->first();
	while (features->more(i)) {
		features->nth(i)->code(env);
		i = features->next(i);
	}
	env->skipAttr = false;

	// Generate code for class_new
	op_type classNewType(this->get_type_name(), 1);
	vector<operand> classNewArgs;
	vp.define(classNewType, this->get_type_name() + "_new", classNewArgs);

	// Generate an entry block for the class
	vp.begin_block("entry");

	// Generate code body for class_new
	op_type classVtableType(this->get_type_name() + "_vtable", 1);
	op_type intType(INT32);
	op_type ptrType(INT8_PTR);
	op_type intPtrType(INT32_PTR);
	int_value zeroOp(0), oneOp(1);
	global_value classVtableValue(classVtableType, this->get_type_name() + "_vtable_prototype");

	operand classVtableGetElementPtr = vp.getelementptr(classVtableType.get_deref_type(), classVtableValue, zeroOp, oneOp, intPtrType);
	operand classLoadOp = vp.load(intPtrType.get_deref_type(), classVtableGetElementPtr);

	// Call malloc
	vector<op_type> mallocArgsTypes;
	vector<operand> mallocArgs;
	mallocArgsTypes.push_back(intType);
	mallocArgs.push_back(classLoadOp);
	operand mallocReturnOp = vp.call(mallocArgsTypes, ptrType, "malloc", true, mallocArgs);

	// Call bitcast
	operand bitcastOp = vp.bitcast(mallocReturnOp, classNewType);
	// Store bitcast result for later use by attrs
	env->bitcastResult = bitcastOp;

	// Call getelementptr
	op_type getElementPtrReturnType(this->get_type_name() + "_vtable**");
	operand* getElementPtrReturnOp = new operand(vp.getelementptr(classNewType.get_deref_type(), bitcastOp, zeroOp, zeroOp, getElementPtrReturnType));

	// Call store
	vp.store(classVtableValue, *getElementPtrReturnOp);

	// Allocate memory for result
	operand* allocaOp = new operand(vp.alloca_mem(classNewType));

	// Store bitcast result and save as local variable
	vp.store(bitcastOp, *allocaOp);
	env->add_local(self, *allocaOp);
	if (cgen_debug) std::cerr << "allocaOp type:" << allocaOp->get_type().get_name() << endl;

	// Generate code for attributes
	i = features->first();
	while (features->more(i)) {
		features->nth(i)->code(env);
		i = features->next(i);
	}
	
	env->skipAttr = true;

	// Return bitcast result
	vp.ret(bitcastOp);

	// Generate code for abort block
	vp.begin_block("abort");
	vector<op_type> abortArgsTypes;
	vector<operand> abortArgs;
	operand abortOp = vp.call(abortArgsTypes, VOID, "abort", true, abortArgs);
	vp.unreachable();
	vp.end_define();

}

// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features()
{
	int i = features->first();
	while (features->more(i)) {
		features->nth(i)->layout_feature(this);
		i = features->next(i);
	}
}
#else

// 
// code-gen function main() in class Main
//
void CgenNode::codeGenMainmain(std::ostream &o)
{
	ValuePrinter vp(o);
	// In Phase 1, this can only be class Main. Get method_class for main().
	assert(std::string(this->name->get_string()) == std::string("Main"));
	method_class* mainMethod = (method_class*) features->nth(features->first());

	// ADD CODE HERE TO GENERATE THE FUNCTION int Mainmain().
	// Generally what you need to do are:
	// -- setup or create the environment, env, for translating this method
	// -- invoke mainMethod->code(env) to translate the method

	CgenEnvironment *env = new CgenEnvironment(o, this);
	// Create variables for defining Main_main
	vector<operand> mainmainArgs;
	op_type returnType(INT32);
	// Define Main_main function
	vp.define(returnType, "Main_main", mainmainArgs);
	// Generate Main_main using main
	string blockName("entry");
	vp.begin_block(blockName);
	mainMethod->code(env);
	vp.end_define();

}

#endif

//
// CgenEnvironment functions
//

//
// Class CgenEnvironment should be constructed by a class prior to code
// generation for each method.  You may need to add parameters to this
// constructor.
//
CgenEnvironment::CgenEnvironment(std::ostream &o, CgenNode *c)
{
	cur_class = c;
	cur_stream = &o;
	var_table.enterscope();
	tmp_count = block_count = ok_count = 0;
	// ADD CODE HERE
}

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t) {
	return t == SELF_TYPE ? get_class() 
		: get_class()->get_classtable()->lookup(t);
}

// Provided CgenEnvironment methods
// Generate unique string names
std::string CgenEnvironment::new_name() {
	std::stringstream s;
	s << tmp_count++;
	return "tmp." + s.str();
}

std::string CgenEnvironment::new_ok_label() {
	std::stringstream s;
	s << ok_count++;
	return "ok." + s.str();
}
const std::string CgenEnvironment::new_label(const std::string& prefix,
		bool increment) {
	std::string suffix = itos(block_count);
	block_count += increment;
	return prefix + suffix;
}

void CgenEnvironment::add_local(Symbol name, operand &vb) {
	var_table.enterscope();
	var_table.addid(name, &vb);
}

void CgenEnvironment::kill_local() {
	var_table.exitscope();
}

op_type CgenEnvironment::get_arg_type(string s) {
	if (s == "i1") {
		return op_type(INT1);
	} else if (s == "i32") {
		return op_type(INT32);
	} else if (s == "i8*") {
		return op_type(INT8_PTR);
	}
	return op_type(s.substr(1));
}

vector<op_type> CgenEnvironment::parse_args(string s) {
	vector<op_type> result;
	if (s.find('(', 0) == string::npos) {
		result.push_back(op_type(s));
		return result;
	}

	stringstream ss(s);
	string temp1, temp2;
	getline(ss, temp1, '(');
	getline(ss, temp2, ')');
	if (cgen_debug) std::cerr << "temp2: " << temp2 << endl;
	string args = temp2;
	//string args = s.substr(temp1.length() + 1, s.length() - 1 - (temp2.length() + 1));
	int offset = 0;
	for (int i = 0; i < args.length();) {
		if (args.at(i) == ' ') {
			i++;
			continue;
		}
		args.at(offset++) = args.at(i++);
	}
	args.resize(offset);
	stringstream ss1(args);
	string token;
	while (getline(ss1, token, ',')) {
		result.push_back(get_arg_type(token));
	}

	return result;


}


////////////////////////////////////////////////////////////////////////////
//
// APS class methods
//
////////////////////////////////////////////////////////////////////////////

//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.handcode.h'.
//
//*****************************************************************

#ifdef MP3
// conform and get_class_tag are only needed for MP3

// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env) {
	// ADD CODE HERE (MP3 ONLY)
	return operand();
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env) {
	// ADD CODE HERE (MP3 ONLY)
	return operand();
}
#endif

//
// Create a method body
// 
void method_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "method" << endl;
	if (!env->skipAttr) {
		return;
	}
	ValuePrinter vp(*(env->cur_stream));
	op_type methodReturnType(get_method_type(return_type->get_string()));
	if (cgen_debug) std::cerr << "return type: " << return_type->get_string() << endl;
	if (string(return_type->get_string()).compare("SELF_TYPE") == 0) {
		if (cgen_debug) std::cerr << "here" << endl;
		methodReturnType = op_type(env->get_class()->get_type_name(), 1);
	}
	op_type classType(env->get_class()->get_type_name(), 1);
	operand selfOp(classType, "self");
	vector<operand> methodArgs;
	string methodName = env->get_class()->get_type_name() + "_" + string(name->get_string());
	if (cgen_debug) std::cerr << "method name: " << methodName << endl;
	if (cgen_debug) std::cerr << "class type: " << env->get_class()->get_type_name() << endl;
	methodArgs.push_back(selfOp);
	env->localSymbolVec.push_back(self);

	// Loop over formals and save their info
	for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
		op_type formalType(env->get_class()->get_ret_type(formals->nth(i)->get_type_decl()->get_string(), true));
		operand formalOp(formalType, string(formals->nth(i)->get_name()->get_string()));
		methodArgs.push_back(formalOp);
		env->localSymbolVec.push_back(formals->nth(i)->get_name());
	}

	// Define method
	if (cgen_debug) std::cerr << "method return type: " << methodReturnType.get_name() << endl;
	vp.define(methodReturnType, methodName, methodArgs);

	// Create entry block
	vp.begin_block("entry");

	// Deal with other formals
	operand allocaOp;
	for (int i = 0; i < methodArgs.size(); i++) {
		allocaOp = vp.alloca_mem(methodArgs.at(i).get_type());
		if (string(env->localSymbolVec.at(i)->get_string()) == "self") {
			op_type allocaType(allocaOp.get_type());
			allocaType.set_id(OBJ_PPTR);
			allocaOp = operand(allocaType, allocaOp.get_name().substr(1));
		}

		env->add_local(env->localSymbolVec.at(i), allocaOp);
		vp.store(methodArgs.at(i), allocaOp);
	}

	// Generate body of method
	operand methodResult = expr->code(env);
	if (methodResult.get_type().get_name() != methodReturnType.get_name()) {
		if (cgen_debug) std::cerr << "methodResult: " << methodResult.get_type().get_name() << endl;
		if (cgen_debug) std::cerr << "methodReturnType: " << methodReturnType.get_name() << endl;
		methodResult = vp.bitcast(methodResult, methodReturnType);
	}

	// Return
	vp.ret(methodResult);

	// Generate abort block after every method
	vector<op_type> abortTypes;
	vector<operand> abortArgs;
	string abortBlock("abort");
	vp.begin_block(abortBlock);
	operand abortResult = vp.call(abortTypes, VOID, "abort", true, abortArgs);
	vp.unreachable();

	vp.end_define();
}

//
// Codegen for expressions.  Note that each expression has a value.
//

operand assign_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "assign" << endl;
	ValuePrinter vp(*(env->cur_stream));
	// Find correct operand from var_table
	operand assignResult = *(env->lookup(self));
	// Evaluate expression
	operand exprResult = expr->code(env);
	// Load operand
	operand loadOp = vp.load(assignResult.get_type().get_deref_type(), assignResult);
	// Generate a getelementptr for loaded operand
	int_value zeroOp(0), oneOp(1);
	op_type exprPtrType(exprResult.get_type().get_ptr_type());
	operand getElementPtrOp = vp.getelementptr(loadOp.get_type().get_deref_type(), loadOp, zeroOp, oneOp, exprPtrType);
	// Store result
	vp.store(*(env->cur_stream), exprResult, getElementPtrOp);
	// Return result
	return exprResult;
}

operand cond_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "cond" << endl;
	ValuePrinter vp(*(env->cur_stream));
	// Create block labels for each case
	string thenCond = env->new_label("true.", false);
	string elseCond = env->new_label("false.", false);
	string endCond = env->new_label("end.", true);

	// Determine the amount of memory to alloca and create var
	op_type resultType(INT32);
	if (string(then_exp->get_type()->get_string()).compare("Bool") == 0) {
		resultType = INT1;
	}
	operand condResult(resultType.get_ptr_type(), env->new_name());
	vp.alloca_mem(*(env->cur_stream), resultType, condResult);

	// Evaluate pred and take correct path
	vp.branch_cond(*(env->cur_stream), pred->code(env), thenCond, elseCond);

	// pred == true
	vp.begin_block(thenCond);
	operand thenResult = then_exp->code(env);
	vp.store(*(env->cur_stream), thenResult, condResult);
	vp.branch_uncond(*(env->cur_stream), endCond);

	// pred == false
	vp.begin_block(elseCond);
	operand elseResult = else_exp->code(env);
	vp.store(*(env->cur_stream), elseResult, condResult);
	vp.branch_uncond(*(env->cur_stream), endCond);

	// End of conditional
	vp.begin_block(endCond);
	operand finalResult(condResult.get_type().get_deref_type(), env->new_name());
	vp.load(*(env->cur_stream), resultType, condResult, finalResult);
	return finalResult;
}

operand loop_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "loop" << endl;
	ValuePrinter vp(*(env->cur_stream));
	// Create blocks for each case
	string loopCond1 = env->new_label("loop.", false);
	string loopCond2 = env->new_label("true.", false);
	string loopCond3 = env->new_label("false.", true);
	
	// Unconditional branch to check pred
	vp.branch_uncond(*(env->cur_stream), loopCond1);
	vp.begin_block(loopCond1);
	operand predResult = pred->code(env);
	// Goto true if pred is true, go to false if pred is false
	vp.branch_cond(*(env->cur_stream), predResult, loopCond2, loopCond3);

	// Body of loop, evaluate expression(s)))
	vp.begin_block(loopCond2);
	operand bodyResult = body->code(env);
	// Goto loop to check pred again
	vp.branch_uncond(*(env->cur_stream), loopCond1);

	// Return
	vp.begin_block(loopCond3);
	return bodyResult;
} 

operand block_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "block" << endl;
	operand blockResult;
	// Iterate through block, save each evaluated expr
	// and return last expr as value of the block
	for (int i = body->first(); body->more(i); i = body->next(i)) {
		blockResult = body->nth(i)->code(env);
	}

	return blockResult;
}

operand let_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "let" << endl;
	ValuePrinter vp(*(env->cur_stream));
	// Check type to decide amount of memory to alloca
	op_type initType(type_decl->get_string(), 1);
	/*if (string(type_decl->get_string()).compare("Bool") == 0) {
		initType = INT1;
	}*/
	// Get results of init expr if present
	operand initResult = init->code(env);
	if (cgen_debug) std::cerr << "type_decl: " << type_decl->get_string() << endl;
	operand localVar = vp.alloca_mem(initType);
	//vp.alloca_mem(*(env->cur_stream), initType, localVar);
	env->add_local(identifier, localVar);

	// If no init expr, init to default vals
	// Else, store init val in localVar
	if (initResult.get_type().get_id() == EMPTY) {
		initResult.set_type(initType);
		/*if (cgen_debug) std::cerr << "empty case" << endl;
		string defaultVal = "0";
		if (initType.get_id() == INT1) {
			defaultVal = "false";
		}
		vp.store(*(env->cur_stream), const_value(initType, defaultVal, true), localVar);*/
		vp.store(*(env->cur_stream), initResult, localVar);
	} else {
		vp.store(*(env->cur_stream), initResult, localVar);
	}

	// Continue through let statement
	return body->code(env);
}

operand plus_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "plus" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);
	operand plusResult(e1Result.get_type(), env->new_name());
	vp.add(*(env->cur_stream), e1Result, e2Result, plusResult);
	return plusResult;
}

operand sub_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "sub" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);
	operand subResult(e1Result.get_type(), env->new_name());
	vp.sub(*(env->cur_stream), e1Result, e2Result, subResult);
	return subResult;
	
}

operand mul_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "mul" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);
	operand mulResult(e1Result.get_type(), env->new_name());
	vp.mul(*(env->cur_stream), e1Result, e2Result, mulResult);
	return mulResult;
}

operand divide_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "div" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);

	// Create new ok block, check if not dividing by 0
	// Goto abort block if dividing by 0, 
	// Goto ok block if not
	string newOk = env->new_ok_label();
	operand equalResult(op_type(INT1), env->new_name());
	vp.icmp(*(env->cur_stream), EQ, e2Result, int_value(0), equalResult);
	vp.branch_cond(equalResult, "abort", newOk);

	vp.begin_block(newOk);
	operand finalResult(e1Result.get_type(), env->new_name());
	vp.div(*(env->cur_stream), e1Result, e2Result, finalResult);
	return finalResult;
}

operand neg_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "neg" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand finalResult(e1Result.get_type(), env->new_name());
	vp.sub(*(env->cur_stream), int_value(0), e1Result, finalResult);
	return finalResult;
}

operand lt_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "lt" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);
	operand finalResult(op_type(INT1), env->new_name());
	vp.icmp(*(env->cur_stream), LT, e1Result, e2Result, finalResult);
	return finalResult;
}

operand eq_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "eq" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);
	operand finalResult(op_type(INT1), env->new_name());
	vp.icmp(*(env->cur_stream), EQ, e1Result, e2Result, finalResult);
	return finalResult;
}

operand leq_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "leq" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand e2Result = e2->code(env);
	operand finalResult(op_type(INT1), env->new_name());
	vp.icmp(*(env->cur_stream), LE, e1Result, e2Result, finalResult);
	return finalResult;
}

operand comp_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "complement" << endl;
	ValuePrinter vp(*(env->cur_stream));
	operand e1Result = e1->code(env);
	operand finalResult(e1Result.get_type(), env->new_name());
	// Use vp.xor_in to find the complement
	vp.xor_in(*(env->cur_stream), e1Result, bool_value(true, true), finalResult);
	return finalResult;
}

operand int_const_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "Integer Constant" << endl;
	int_value intConst(atoi(token->get_string()));
	return intConst;
}

operand bool_const_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "Boolean Constant" << endl;
	bool_value boolConst(val, false);
	return boolConst;
}

operand object_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "Object" << endl;
	ValuePrinter vp(*(env->cur_stream));
	// Find object in lookup table
	operand* lookupResult = env->lookup(name);
	if (string(lookupResult->get_name()) == "%empty") {
		if (cgen_debug) std::cerr << "empty" << endl;
		lookupResult = env->lookup(self);
	}

	// Load object
	operand loadOp = vp.load(lookupResult->get_type().get_deref_type(), *lookupResult);
	// Check if object is local, do a getelementptr if not
	bool isLocal = false;
	for (int i = 0; i < env->localSymbolVec.size(); i++) {
		if (string(env->localSymbolVec.at(i)->get_string()) == string(name->get_string())) {
			isLocal = true;
			break;
		}
	}

	if (!isLocal) {
		int_value zeroOp(0), oneOp(1);
		operand* nameLookupOp = env->lookup(name);
		op_type nameLookupType(nameLookupOp->get_type());
		operand tempResult;
		if (cgen_debug) std::cerr << "class name: " << "%" + env->get_class()->get_type_name() + "*" << endl;
		if (string("%" + env->get_class()->get_type_name() + "*").compare(loadOp.get_type().get_name()) == 0) {
			if (cgen_debug) std::cerr << "getElementPtr type: " << loadOp.get_type().get_deref_type().get_name() << endl;
			tempResult = vp.getelementptr(loadOp.get_type().get_deref_type(), loadOp, zeroOp, oneOp, nameLookupType);
		} else {
			tempResult = vp.getelementptr(loadOp.get_type(), loadOp, zeroOp, oneOp, nameLookupType);
		}
		if (cgen_debug) std::cerr << "get_type: " << loadOp.get_type().get_name() << endl;
		if (cgen_debug) std::cerr << "name: " << name->get_string() << endl;
		//operand tempResult = vp.getelementptr(loadOp.get_type(), loadOp, zeroOp, oneOp, nameLookupType);
		operand* getElementPtrResult = new operand(tempResult.get_type(), tempResult.get_name().substr(1));
		if (cgen_debug) std::cerr << "getElementPtrResult name: " << getElementPtrResult->get_name() << endl;
		env->add_local(SELF_TYPE, *getElementPtrResult);
	} else {
		env->add_local(SELF_TYPE, *lookupResult);
	}
	/*
	op_type resultType = lookupResult.get_type().get_deref_type();
	operand finalResult(resultType, env->new_name());
	vp.load(*(env->cur_stream), resultType, lookupResult, finalResult);
	*/
	return loadOp;
}

operand no_expr_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "No_expr" << endl;
	// Just need an empty operand
	operand noOp;
	return noOp;
}

//*****************************************************************
// The next few functions are for node types not supported in Phase 1
// but these functions must be defined because they are declared as
// methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************

operand static_dispatch_class::code(CgenEnvironment *env) 
{ 
	if (cgen_debug) std::cerr << "static dispatch" << endl;
	operand noOp;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
#endif
	return noOp;
}

operand string_const_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "string_const" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	if (cgen_debug) std::cerr << "string token: " << token->get_string() << endl;
	ValuePrinter vp(*(env->cur_stream));
	CgenClassTable* ct = env->get_class()->get_classtable();
	op_type stringType(INT8_PTR);
	for (int i = stringtable.first(); stringtable.more(i); i = stringtable.next(i)) {
		if (token->get_string() == stringtable.lookup(i)->get_string()) {
			if (cgen_debug) std::cerr << "token found" << endl;
			global_value* stringOp = new global_value(stringType, "String." + itos(i));
			env->add_local(SELF_TYPE, *stringOp);
		}
	}
	operand stringOp(stringType, "temp");
	return stringOp;
#endif
	return operand();
}

operand dispatch_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "dispatch" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	ValuePrinter vp(*(env->cur_stream));
	op_type dispatchType(env->get_class()->get_type_name());
	operand secondLoadOp;
	vector<operand> dispatchArgs;
	int i = actual->first();
	// Loop over dispatch args and load them
	while (actual->more(i)) {
		actual->nth(i)->code(env);
		dispatchType = env->get_class()->get_ret_type(actual->nth(i)->get_type()->get_string(), false);
		if (cgen_debug) std::cerr << env->get_class()->get_ret_type(actual->nth(i)->get_type()->get_string(), false).get_name() << endl;
		operand* lookupOp = env->lookup(expr->get_type());
		if (cgen_debug) std::cerr << "typename: " << lookupOp->get_name() << endl;
		if (dispatchType.get_name() == "%String*") {
			global_value tempOp(dispatchType, lookupOp->get_name().substr(1));
			secondLoadOp = operand(tempOp);
		} else {
			operand dispatchArg(dispatchType.get_ptr_type(), lookupOp->get_name().substr(1));
			secondLoadOp = vp.load(dispatchType, dispatchArg);
		}
		//actual->nth(i)->code(env);
		i = actual->next(i);
	}

	// Do second load
	operand* secondLookupOp = env->lookup(expr->get_type());
	op_type dispatchArgType(env->get_class()->get_type_name(), 1);
	operand dispatchArg(dispatchType.get_ptr_type(), env->get_class()->get_type_name());
	//operand secondLoadOp = vp.load(dispatchArgType, dispatchArg);

	// Generate code for dispatch expression and save it
	operand expressionOp = expr->code(env);
	dispatchArgs.push_back(expressionOp);

	// Save result of load
	dispatchArgs.push_back(secondLoadOp);

	// Generate code for icmp
	op_type boolType(INT1);
	null_value nullValue(expressionOp.get_type());
	operand icmpOp = vp.icmp(EQ, expressionOp, nullValue);

	// Generate branch condition
	string okName = env->new_ok_label();
	vp.branch_cond(*(env->cur_stream), icmpOp, "abort", okName);

	// Begin ok block
	vp.begin_block(okName);

	// Generate getelementptr to get vtable
	int_value zeroOp(0);
	string vtableName = env->get_class()->get_type_name() + "_vtable**";
	op_type vtableType(vtableName);
	vtableType.set_id(OBJ_PPTR);
	operand getElementPtrVtable = vp.getelementptr(expressionOp.get_type().get_deref_type(), expressionOp, zeroOp, zeroOp, vtableType);
	//if (cgen_debug) std::cerr << "here" << endl;

	// Load vtable
	operand vtableLoadOp = vp.load(vtableType.get_deref_type(), getElementPtrVtable);

	// Generate getelementptr for specific function
	// Find function in vtable and load it
	operand foundOp;
	op_type functionPtrType;
	operand* loadFunctionOp;
	op_type* functionType;
	if (cgen_debug) std::cerr << "looking for: " << string(name->get_string()) << endl;
	if (cgen_debug) std::cerr << "vtableFuncNames size: " << env->get_class()->vtableFuncNames.size() << endl;

	for (int i = 0; i < env->get_class()->vtableFuncNames.size(); i++) {
		if (cgen_debug) std::cerr << "looking at: " << string(env->get_class()->vtableFuncNames.at(i)) << endl;
		if (string(env->get_class()->vtableFuncNames.at(i)) == string(name->get_string())) {
			int_value offsetValue(i);
			foundOp = vp.getelementptr(vtableLoadOp.get_type().get_deref_type(), vtableLoadOp, zeroOp, offsetValue, vtableType);
			functionPtrType = op_type(env->get_class()->vtableTypes.at(i).get_name().substr(1), 1);
			functionType = new op_type(env->get_class()->vtableTypes.at(i).get_name());
			functionPtrType.set_id(OBJ_PPTR);
			loadFunctionOp = new operand(functionPtrType, foundOp.get_name().substr(1));
			break;
		}
	}

	operand finalLoadOp = vp.load(loadFunctionOp->get_type().get_deref_type(), *loadFunctionOp);

	// Call the loaded function
	op_type classType(env->get_class()->get_type_name(), 1);
	if (cgen_debug) std::cerr << "functionType name: " << functionType->get_name() << endl;
	vector<op_type> functionArgsTypes = env->parse_args(functionType->get_name());
	operand callOp = vp.call(functionArgsTypes, classType, finalLoadOp.get_name().substr(1), false, dispatchArgs);

	return callOp;
	
#endif
	operand noOp;
	return noOp;
}

operand typcase_class::code(CgenEnvironment *env)
{
	if (cgen_debug) 
		std::cerr << "typecase::code()" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	ValuePrinter vp(*(env->cur_stream));
	CgenClassTable* ct = env->get_class()->get_classtable();

	// Generate labels
	string headerLabel = env->new_label("case.hdr.", false);
	string exitLabel = env->new_label("case.exit.", true);

	operand codeOp = expr->code(env);
	op_type joinType = env->type_to_class(expr->get_type())->get_type_name();
	CgenNode* cls = env->type_to_class(expr->get_type());

	// Handle void case
	if (codeOp.get_typename() != "%Int*" && codeOp.get_typename() != "%Bool*") {
		op_type boolType(INT1), emptyType;
		null_value nullValue(codeOp.get_type());
		operand icmpOp = vp.icmp(EQ, codeOp, nullValue);
		string okLabel = env->new_ok_label();
		vp.branch_cond(icmpOp, "abort", okLabel);
	}

	vp.branch_uncond(headerLabel);
	operand tagOp = get_class_tag(codeOp, cls, env);
	branch_class* b = (branch_class*)cases->nth(cases->first());
	string caseResultTypeName = b->get_expr()->get_type()->get_string();
	if (caseResultTypeName == "SELF_TYPE") {
		caseResultTypeName = env->get_class()->get_type_name();
	}

	op_type allocaType(caseResultTypeName, 1);
	operand allocaOp = vp.alloca_mem(allocaType);
	env->branch_operand = allocaOp;

	// Loop over cases and save results
	vector<operand> values;
	for (int i = ct->get_num_classes() - 1; i >= 0; i--) {
		for (int j = cases->first(); cases->more(j); j = cases->next(j)) {
			if (i == ct->lookup(cases->nth(j)->get_type_decl())->get_tag()) {
				string caseLabel = env->new_label("case." + itos(i) + ".", false);
				vp.branch_uncond(caseLabel);
				operand caseValue = cases->nth(j)->code(codeOp, tagOp, joinType, env);
				values.push_back(caseValue);
			}
		}
	}

	// Generate code for abort
	env->new_label("", true);
	vp.branch_uncond("abort");
	operand loadOp = vp.load(allocaType.get_ptr_type(), allocaOp);
	return loadOp;
	
#endif
	return operand();
}

operand new__class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "newClass" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	ValuePrinter vp(*(env->cur_stream));
	vector<operand> args;
	vector<op_type> argsTypes;
	operand noOp;
	op_type noType;
	op_type emptyType(string(type_name->get_string()), 1);
	//argsTypes.push_back(noType);
	args.push_back(noOp);

	if (cgen_debug) std::cerr << "class name: " << type_name->get_string() << endl;
	operand tempOp(emptyType, string(type_name->get_string()) + "*");
	operand* finalOp = new operand(tempOp);
	operand callOp = vp.call(argsTypes, emptyType, string(type_name->get_string()) + "_new", false, args);
	env->add_local(type_name, *finalOp);
	return callOp;
#endif
	return operand();
}

operand isvoid_class::code(CgenEnvironment *env) 
{
	if (cgen_debug) std::cerr << "isvoid" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
#endif
	return operand();
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls) 
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// Setup environment
	CgenEnvironment* env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
	// Save info about self
	op_type selfReturnType(cls->get_ret_type(cls->get_type_name(), false));
	operand selfOp(selfReturnType, name->get_string());
	vector<op_type> formalTypeVec;
	formalTypeVec.push_back(selfReturnType);

	// Save info about method formals
	int ct = 0;
	for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
		if (cgen_debug) std::cerr << formals->nth(i)->get_type_decl()->get_string() << endl;
		op_type formalType(cls->get_ret_type(formals->nth(i)->get_type_decl()->get_string(), true));
		formalTypeVec.push_back(formalType);
		operand tempOp(formalType, formals->nth(i)->get_type_decl()->get_string());
		cls->formalOps.push_back(tempOp);
		ct++;
	}

	cls->numFormalOps.push_back(ct);
	if (!cls->check_basic(cls->get_type_name(), false)) {
		// add feature to vtable
		op_type featureType(cls->get_ret_type(return_type->get_string(), false));
		if (cgen_debug) std::cerr << "class type: " << cls->get_type_name() << endl;
		if (cls->get_type_name() == featureType.get_name().substr(1)) {
			featureType.set_type(featureType.get_ptr_type());
		}
		if (cgen_debug) std::cerr << "feature type: " << featureType.get_name() << endl;
		op_func_type featureFuncPtr(featureType, formalTypeVec);
		cls->myVtableTypes.push_back(featureFuncPtr);
		if (featureType.get_name().at(0) == '%') {
			cls->myVtableReturnTypes.push_back(featureType.get_name().substr(1));
		} else {
			cls->myVtableReturnTypes.push_back(featureType.get_name());
		}

		// add info for vtable prototype
		std::string featureName = "@" + cls->get_type_name() + "_" + name->get_string();
		op_type featureNameType(featureName);
		const_value featureNameValue(featureNameType, featureName, false);
		cls->myVtableValues.push_back(featureNameValue);

	}

	if (cgen_debug) std::cerr << "Done with layout_feature for class: " << this->name->get_string() << endl;
	
#endif
}

// If the source tag is >= the branch tag and <= (max child of the branch class) tag,
// then the branch is a superclass of the source
operand branch_class::code(operand expr_val, operand tag,
				op_type join_type, CgenEnvironment *env) {
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	ValuePrinter vp(*(env->cur_stream));
	CgenNode* cls = env->get_class()->get_classtable()->lookup(type_decl);

	int myTag = cls->get_tag();
	// Generate labels for branching
	string gteLabel = env->new_label("src_gte_br." + itos(myTag) + ".", false);
	string lteLabel = env->new_label("src_lte_mc." + itos(myTag) + ".", false);
	string exitLabel = env->new_label("br_exit." + itos(myTag) + ".", true);

	// Generate icmp comparing source tag to class tag
	op_type boolType(INT1);
	op_type intType(INT32);
	int_value myTagValue(myTag);
	op_type tagType(tag.get_type());
	tag.set_type(intType);
	operand icmpOp = vp.icmp(LT, tag, myTagValue);
	vp.branch_cond(icmpOp, exitLabel, gteLabel);

	// Compare source tag to max child
	int maxChild = cls->get_max_child();
	int_value maxChildValue(maxChild);
	operand secondIcmpOp = vp.icmp(GT, tag, maxChildValue);
	vp.branch_cond(secondIcmpOp, exitLabel, lteLabel);
	tag.set_type(tagType);

	// Handle arbitrary casts to Int or Bool
	if (cls->get_type_name() == "Int" || cls->get_type_name() == "Bool") {
		expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
	}
	op_type allocaType(cls->get_type_name(), 1);
	operand* allocaOp = new operand(vp.alloca_mem(allocaType));
	operand conformOp = conform(expr_val, allocaType, env);
	vp.store(conformOp, *allocaOp);

	operand secondConformOp = conform(expr->code(env), join_type.get_ptr_type(), env);
	operand thirdConformOp = conform(secondConformOp, env->branch_operand.get_type(), env);

	env->branch_operand.set_type(env->branch_operand.get_type().get_ptr_type());
	vp.store(thirdConformOp, env->branch_operand);
	env->branch_operand.set_type(env->branch_operand.get_type().get_deref_type());

	env->kill_local();
	vp.branch_uncond(env->next_label);
	return thirdConformOp;

#endif
	return operand();
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls)
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	CgenEnvironment* env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
	if (string(type_decl->get_string()) == string("bool") || string(type_decl->get_string()) == string("Bool")) {
		cls->myVtableAttrTypes.push_back(op_type(INT1));
	} else if (string(type_decl->get_string()) == string("int") || string(type_decl->get_string()) == string("Int")) {
		cls->myVtableAttrTypes.push_back(op_type(INT32));
	} else if (string(type_decl->get_string()) == string("sbyte*")) {
		cls->myVtableAttrTypes.push_back(op_type(INT8_PTR));
	} else {
		cls->myVtableAttrTypes.push_back(op_type(type_decl->get_string(), 1));
	}
#endif
}

void attr_class::code(CgenEnvironment *env)
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	if (env->skipAttr) {
		// Create space for attrs for later
		op_type typeDeclType(env->get_class()->get_ret_type_ptr(type_decl->get_string()));
		operand* emptyOp = new operand(typeDeclType, "empty");
		env->add_local(name, *emptyOp);
		return;
	}

	// Time to store correct value for attrs
	ValuePrinter vp(*(env->cur_stream));
	op_type intPtrType(INT32_PTR);
	int_value zeroOp(0), oneOp(1);
	operand* initResult = new operand(init->code(env));
	operand* lookupResult = env->lookup(self);

	operand lookupOp(intPtrType, lookupResult->get_name());
	op_type initResultType(initResult->get_type().get_ptr_type());
	op_type attrType(env->get_class()->get_type_name(), 1);

	operand attrOp(attrType, env->bitcastResult.get_name().substr(1, env->bitcastResult.get_name().length()-1));
	operand attrReturnOp = vp.getelementptr(attrType.get_deref_type(), attrOp, zeroOp, oneOp, initResultType);
	vp.store(*(env->cur_stream), *initResult, attrReturnOp);

#endif
}

