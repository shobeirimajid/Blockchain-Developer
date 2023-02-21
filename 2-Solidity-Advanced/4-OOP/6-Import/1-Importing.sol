/*
    --------------------------------
    Importing other Source Files
    --------------------------------


    --------------------------------
    Syntax and Semantics
    --------------------------------
    Solidity supports import statements to help modularise your code 
    that are similar to those available in JavaScript (from ES6 on). 
    However, Solidity does not support the concept of a default export.

    At a global level, you can use import statements of the following form:

        import "filename";

    The filename part is called an import path. 
    This statement imports all global symbols from “filename” (and symbols imported there) 
    into the current global scope (different than in ES6 but backwards-compatible for Solidity). 

    This form is not recommended for use, 
    because it unpredictably pollutes the namespace. 

    If you add new top-level items inside “filename”, 
    they automatically appear in all files that import like this from “filename”. 
    It is better to import specific symbols explicitly.

    The following example creates a new global symbol symbolName 
    whose members are all the global symbols from "filename":

        import * as symbolName from "filename";

    which results in all global symbols being available in the format symbolName.symbol.


    A variant of this syntax that is not part of ES6, but possibly useful is:

        import "filename" as symbolName;

        which is equivalent to :

        import * as symbolName from "filename";


    If there is a naming collision, 
    you can rename symbols while importing. 
    For example, the code below creates new global symbols alias and symbol2 
    which reference symbol1 and symbol2 from inside "filename", respectively.

        import {symbol1 as alias, symbol2} from "filename";


    ---------------------
    Import Paths
    ---------------------
    In order to be able to support reproducible builds on all platforms, 
    the Solidity compiler has to abstract away the details of the filesystem where source files are stored.

    For this reason import paths do not refer directly to files in the host filesystem. 

    Instead the compiler maintains an internal database (virtual filesystem or VFS for short) 
    where each source unit is assigned a unique source unit name 
    which is an opaque and unstructured identifier. 
    
    The import path specified in an import statement 
    is translated into a "source unit name" and used to find the corresponding source unit in this database.

    Using the Standard JSON API it is possible to 
    directly provide the names and content of all the source files as a part of the compiler input. 
    In this case source unit names are truly arbitrary. 

    If, however, you want the compiler to automatically find and load source code into the VFS, 
        your source unit names need to be structured in a way that 
        makes it possible for an import callback to locate them. 
        When using the command-line compiler the default import callback 
        supports only loading source code from the host filesystem, 
        which means that your source unit names must be paths. 
        
    Some environments provide custom callbacks that are more versatile. 
    For example the Remix IDE provides one that lets you import files from
        - HTTP
        - IPFS 
        - Swarm URLs 
        - refer directly to packages in NPM registry


    ------------------------
    Import Path Resolution
    ------------------------
    a complete description of the virtual filesystem and the path resolution logic used by the compiler

    In order to be able to support reproducible builds on all platforms, 
    the Solidity compiler has to abstract away the details of the filesystem where source files are stored. 
    Paths used in imports must work the same way everywhere
     while the command-line interface must be able to work with platform-specific paths 
     to provide good user experience. 
    
    This section aims to explain in detail how Solidity reconciles these requirements.


    ------------------------
    Virtual Filesystem
    ------------------------
    The compiler maintains an internal database (virtual filesystem or VFS for short) 
    where each source unit is assigned a unique source unit name 
    which is an opaque and unstructured identifier.
    
    When you use the import statement, 
        you specify an import path that references a source unit name.


    ------------------------
    Import Callback
    ------------------------
    The VFS is initially populated only with files the compiler has received as input. 
    Additional files can be loaded during compilation using an import callback, 
    which is different depending on the type of compiler you use (see below). 
    
    If the compiler does not find any source unit name matching the import path in the VFS,
     it invokes the callback, which is responsible for obtaining the source code 
     to be placed under that name. 
     
    An import callback is free to interpret source unit names in an arbitrary way, not just as paths. 
     
    If there is no callback available when one is needed 
    or if it fails to locate the source code, compilation fails.

    The command-line compiler provides the Host Filesystem Loader 
        a rudimentary callback that interprets a source unit name as a path in the local filesystem. 
        
    The JavaScript interface does not provide any by default, 
    but one can be provided by the user. 
    
    This mechanism can be used to obtain source code 
        from locations other then the local filesystem 
        (which may not even be accessible, e.g. when the compiler is running in a browser). 
        
    For example the Remix IDE provides a versatile callback 
    that lets you import files from HTTP, IPFS and Swarm URLs or refer directly to packages in NPM registry.

    ------------------------
    Note
    ------------------------
    Host Filesystem Loader’s file lookup is platform-dependent. 
    For example backslashes in a source unit name can be interpreted as directory separators 
    or not and the lookup can be case-sensitive or not, 
    depending on the underlying platform.

    For portability 
    it is recommended to avoid using import paths that will work correctly only with a specific import callback 
    or only on one platform. 
    
    For example you should always use forward slashes 
        since they work as path separators also on platforms that support backslashes.

    
    ------------------------------------------------
    Initial Content of the Virtual Filesystem
    ------------------------------------------------
    The initial content of the VFS depends on how you invoke the compiler:


    (1) solc / command-line interface

        When you compile a file using the command-line interface of the compiler, 
        you provide one or more paths to files containing Solidity code:

            solc contract.sol /usr/local/dapp-bin/token.sol

        The source unit name of a file loaded this way is constructed by converting its path 
        to a canonical form and, 
        if possible, making it relative to either the base path or one of the include paths. 
        See CLI Path Normalization and Stripping for a detailed description of this process.


    (2) Standard JSON

        When using the Standard JSON API 
            (via either the JavaScript interface or the --standard-json command-line option) 
        you provide input in JSON format, containing, among other things, the content of all your source files.

        The sources dictionary becomes the initial content of the virtual filesystem 
        and its keys are used as source unit names.


    (3) Standard JSON (via import callback)

        With Standard JSON it is also possible to tell the compiler to use the import callback 
        to obtain the source code:

        If an import callback is available, 
        the compiler will give it the strings specified in urls one by one, 
        until one is loaded successfully or the end of the list is reached.

        The source unit names are determined the same way as when using content - 
            they are keys of the sources dictionary and the content of urls does not affect them in any way.

        
    (4) Standard input

        On the command line it is also possible to provide the source by sending it to compiler’s standard input:

            echo 'import "./util.sol"; contract C {}' | solc -

        character '-' used as one of the arguments instructs the compiler 
        to place the content of the standard input in the virtual filesystem 
        under a special source unit name: <stdin>

        Once the VFS is initialized, 
        additional files can still be added to it only through the import callback.

    ----------------------------
    Imports
    ----------------------------
    The import statement specifies an import path. 
    Based on how the import path is specified, 
    we can divide imports into two categories:

        - Direct imports
            where you specify the full source unit name directly.

        - Relative imports
            where you specify a path starting with ./ or ../ 
            to be combined with the source unit name of the importing file.

    ex:
        contracts/contract.sol

        import "./math/math.sol";

        import "contracts/tokens/token.sol";

    In the above (./math/math.sol) and (contracts/tokens/token.sol)
    are import paths while the source unit names they translate to 
    are contracts/math/math.sol and contracts/tokens/token.sol respectively.


    ----------------------------
    Direct Imports
    ----------------------------
    An import that does not start with ./ or ../ is a direct import.

    import "/project/lib/util.sol";             // source unit name:    (/project/lib/util.sol)
    import "lib/util.sol";                      // source unit name:    (lib/util.sol)
    import "@openzeppelin/address.sol";         // source unit name:    (@openzeppelin/address.sol)
    import "https://example.com/token.sol";     // source unit name:    (https://example.com/token.sol)

    After applying any import remappings the import path simply becomes the source unit name.

    ---------------
    Note
    ---------------
    A source unit name is just an identifier and even
     if its value happens to look like a path, 
    it is not subject to the normalization rules you would typically expect in a shell.
    
    Any /./ or /../ segments or sequences of multiple slashes remain a part of it. 
    
    When the source is provided via Standard JSON interface 
    it is entirely possible to associate different content with source unit names 
    that would refer to the same file on disk.


    When the source is not available in the virtual filesystem, 
    the compiler passes the source unit name to the import callback. 
    The Host Filesystem Loader will attempt to use it as a path and look up the file on disk. 
    At this point the platform-specific normalization rules kick in and names 
    that were considered different in the VFS 
    may actually result in the same file being loaded. 
    

    For example :

        /project/lib/math.sol 
            and 
        /project/lib/../lib///math.sol

        are considered completely different in the VFS even though they refer to the same file on disk.

    ---------------
    Note
    ---------------
    Even if an import callback ends up loading source code 
    for two different source unit names  from the same file on disk, 
    the compiler will still see them as separate source units. 
    It is the source unit name that matters, not the physical location of the code.


    ------------------------------
    Relative Imports
    --------------- 
    An import starting with ./ or ../ is a relative import. 
    Such imports specify a path relative to the source unit name of the importing source unit:

        ex:

        /project/lib/math.sol

        import "./util.sol" as util;        // source unit name:    (/project/lib/util.sol)
        import "../token.sol" as token;     // source unit name:    (/project/token.sol)


        lib/math.sol

        import "./util.sol" as util;        // source unit name:    (lib/util.sol)
        import "../token.sol" as token;     // source unit name:    (token.sol)


    ---------------
    Note
    ---------------
    Relative imports always start with ./ or ../ 

    so          import "util.sol"
    unlike      import "./util.sol"

    is a direct import. 
    
    While both paths would be considered relative in the host filesystem, 
    util.sol is actually absolute in the VFS.


    Let us define a path segment as any non-empty part of the path 
    that does not contain a separator and is bounded by two path separators. 
    
    A separator is a forward slash or the beginning/end of the string. 
    
    For example in 
    
        ./abc/..// 
        
    there are three path segments: 
      1-  .
      2-  abc 
      3-  ...


    The compiler resolves the import into a source unit name based on the import path, 
    
    in the following way:

        1. We start with the source unit name of the importing source unit.

        2. The last path segment with preceding slashes is removed from the resolved name.

        3. Then, for every segment in the import path, starting from the leftmost one:

            - If the segment is ., it is skipped.

            - If the segment is .., the last path segment with preceding slashes 
                is removed from the resolved name.

            - Otherwise, the segment (preceded by a single slash if the resolved name is not empty), 
                is appended to the resolved name.


    The removal of the last path segment with preceding slashes is understood to work as follows:

        1. Everything past the last slash is removed 

            i.e.    a/b//c.sol  -->   a/b//

        2. All trailing slashes are removed 
        
            i.e.    a/b// --> a/b


    Note that the process normalizes the part of the resolved source unit name 
    that comes from the import path according to the usual rules for UNIX paths
    
    i.e.    all . and .. are removed 
    
            and multiple slashes are squashed into a single one. 
    
    On the other hand, the part that comes from the source unit name of the importing module 
    remains unnormalized. 
    

    This ensures that the 
        protocol://  
            does not turn into 
        protocol:/ 
    if the importing file is identified with a URL.


    If your import paths are already normalized, 
    you can expect the above algorithm to produce very intuitive results. 
    
    Here are some examples of what you can expect if they are not:

    ex:

        lib/src/../contract.sol

        import "./util/./util.sol";         // source unit name:    (lib/src/../util/util.sol)
        import "./util//util.sol";          // source unit name:    (lib/src/../util/util.sol)
        import "../util/../array/util.sol"; // source unit name:    (lib/src/array/util.sol)
        import "../.././../util.sol";       // source unit name:    (util.sol)
        import "../../.././../util.sol";    // source unit name:    (util.sol)


    ---------------
    Note
    ---------------
    The use of relative imports containing leading .. segments is not recommended. 
    The same effect can be achieved in a more reliable way by using direct imports 
    with base path and include paths.



    -----------------------------
    Base Path and Include Paths
    -----------------------------
    The base path and include paths represent directories 
    that the Host Filesystem Loader will load files from. 
    When a source unit name is passed to the loader, 
    it prepends the base path to it and performs a filesystem lookup. 
    If the lookup does not succeed, 
    the same is done with all directories on the include path list.

    It is recommended to set the base path to the root directory of your project 
    and use include paths to specify additional locations that may contain libraries your project depends on. 
    
    This lets you import from these libraries in a uniform way, 
    no matter where they are located in the filesystem relative to your project. 
    
    For example, if you use npm to install packages and your contract imports
    
         @openzeppelin/contracts/utils/Strings.sol
     
    you can use these options to tell the compiler that 
    the library can be found in one of the npm package directories:

        solc contract.sol \
            --base-path . \
            --include-path node_modules/ \
            --include-path /usr/local/lib/node_modules/

    
    Your contract will compile (with the same exact metadata) 
    no matter whether you install the library in the local or global package directory 
    or even directly under your project root.

    By default the base path is empty, 
    which leaves the source unit name unchanged. 
    When the source unit name is a relative path, 
    this results in the file being looked up in the directory the compiler has been invoked from. 
    It is also the only value that results in absolute paths in source unit names 
    being actually interpreted as absolute paths on disk. 
    If the base path itself is relative, it is interpreted as relative 
    to the current working directory of the compiler.


    -----------------------------
    Note
    -----------------------------
    Include paths cannot have empty values and must be used together with a non-empty base path.


    -----------------------------
    Note
    -----------------------------
    Include paths and base path can overlap as long as 
    it does not make import resolution ambiguous. 
    For example, you can specify a directory inside base path as an include directory 
    or have an include directory that is a subdirectory of another include directory. 
    The compiler will only issue an error 
    if the source unit name passed to the Host Filesystem Loader 
    represents an existing path when combined with multiple include paths or an include path and base path.



    ----------------------------------------------------------
    CLI Path Normalization and Stripping
    ----------------------------------------------------------
    https://docs.soliditylang.org/en/latest/path-resolution.html#cli-path-normalization-and-stripping


    -----------------------------
    Allowed Paths
    -----------------------------
    https://docs.soliditylang.org/en/latest/path-resolution.html#allowed-paths


    -----------------------------
    Import Remapping
    -----------------------------
    https://docs.soliditylang.org/en/latest/path-resolution.html#import-remapping


    -----------------------------
    Using URLs in imports
    -----------------------------
    Most URL prefixes such as 
    
        https:// 
        data:// 
    
    have no special meaning in import paths. 
    
    The only exception is 
    
        file://
    
    which is stripped from source unit names by the Host Filesystem Loader.

    When compiling locally you can use import remapping to replace the  
    protocol and domain part with a local path:

        solc :https://github.com/ethereum/dapp-bin=/usr/local/dapp-bin contract.sol

    Note the leading ':'
    which is necessary when the remapping context is empty. 
    
    Otherwise the 'https:' part would be interpreted by the compiler as the context.

    







*/