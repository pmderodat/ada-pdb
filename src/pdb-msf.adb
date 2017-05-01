package body PDB.MSF is

   -------------
   -- Is_Open --
   -------------

   function Is_Open (File : MSF_File'Class) return Boolean is
   begin
      return raise Program_Error;
   end Is_Open;

   -------------------------------
   -- Has_Living_Stream_Handles --
   -------------------------------

   function Has_Living_Stream_Handles (File : MSF_File'Class) return Boolean is
   begin
      return raise Program_Error;
   end Has_Living_Stream_Handles;

   ----------
   -- Mode --
   ----------

   function Mode (File : MSF_File'Class) return Mode_Type is
   begin
      return raise Program_Error;
   end Mode;

   ----------
   -- Open --
   ----------

   function Open (Filename : String; Mode : Mode_Type) return MSF_File is
   begin
      return raise Program_Error;
   end Open;

   -----------
   -- Close --
   -----------

   procedure Close (File : in out MSF_File'Class) is
   begin
      raise Program_Error;
   end Close;

   ------------------
   -- Stream_Count --
   ------------------

   function Stream_Count (File : MSF_File'Class) return Natural is
   begin
      return raise Program_Error;
   end Stream_Count;

   -------------
   -- Is_Null --
   -------------

   function Is_Null (Stream : Stream_Handle'Class) return Boolean is
   begin
      return raise Program_Error;
   end Is_Null;

   ----------
   -- File --
   ----------

   function File (Stream : Stream_Handle'Class) return MSF_File is
   begin
      return raise Program_Error;
   end File;

   ----------
   -- Open --
   ----------

   function Open
     (File  : in out MSF_File'Class; Index : Natural) return Stream_Handle is
   begin
      return raise Program_Error;
   end Open;

   ----------
   -- Read --
   ----------

   procedure Read
     (Stream : Stream_Handle'Class;
      Bytes  : out String;
      Last   : out Natural) is
   begin
      pragma Unreferenced (Bytes, Last);
      raise Program_Error;
   end Read;

   -----------
   -- Write --
   -----------

   procedure Write (Stream : Stream_Handle'Class; Bytes : String) is
   begin
      null;
   end Write;

end PDB.MSF;
