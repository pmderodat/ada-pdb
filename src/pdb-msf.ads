--  Package dedicated to the handling of the PDB files container format:
--  Multi-Stream Format.

package PDB.MSF is

   type MSF_File is tagged private;
   --  Handle to read/write a MSF file

   type Mode_Type is (In_Mode, In_Out_Mode, Out_Mode);
   --  Access mode for an MSF file

   subtype Readable_Mode_Type is Mode_Type range In_Mode .. In_Out_Mode;
   subtype Writeable_Mode_Type is Mode_Type range In_Out_Mode .. Out_Mode;

   function Is_Open (File : MSF_File'Class) return Boolean;
   --  Return whether File is a handle to an open file

   function Has_Living_Stream_Handles (File : MSF_File'Class) return Boolean;
   --  Return whether File still has living stream handles

   function Mode (File : MSF_File'Class) return Mode_Type
     with Pre => Is_Open (File);
   --  Return the mode with which File was opened

   function Open (Filename : String; Mode : Mode_Type) return MSF_File
     with Post => Is_Open (Open'Result);
   --  Create a new handle to the file that Filename designates, according to
   --  the given mode.

   procedure Close (File : in out MSF_File'Class)
     with Pre  => Is_Open (File) and Has_Living_Stream_Handles (File),
          Post => not Is_Open (File);
   --  Close the File handle. If there are living stream handles that reference
   --  File, this raise a Constraint_Error and leaves the handle open.

   function Stream_Count (File : MSF_File'Class) return Natural
     with Pre => Is_Open (File);
   --  Return the number of existing streams in File

   type Stream_Handle is tagged private;
   --  Handle to read/write to an MSF file stream

   function Is_Null (Stream : Stream_Handle'Class) return Boolean;
   --  Return whether Stream is a living stream handle

   function File (Stream : Stream_Handle'Class) return MSF_File
     with Pre => not Is_Null (Stream);
   --  Return the File that Stream is bound to

   function Open
     (File  : in out MSF_File'Class; Index : Natural) return Stream_Handle
     with Pre => Is_Open (File)
                 and (Mode (File) in Writeable_Mode_Type
                      or Index < Stream_Count (File));
   --  Return a stream handle for the Index'th stream in File. Create the
   --  stream if it does not exist and if File is writeable.

   procedure Read
     (Stream : Stream_Handle'Class;
      Bytes  : out String;
      Last   : out Natural)
     with Pre => Mode (File (Stream)) in Readable_Mode_Type;
   --  Read at most Bytes'Length bytes from Stream and store in Last the index
   --  of the last byte stored in Bytes.

   procedure Write (Stream : Stream_Handle'Class; Bytes : String)
     with Pre => Mode (File (Stream)) in Writeable_Mode_Type;
   --  Write the content of Bytes to Stream

private

   type MSF_File is tagged null record;

   type Stream_Handle is tagged null record;

end PDB.MSF;
