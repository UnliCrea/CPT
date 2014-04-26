<?php

namespace Model;

class PatchNotesModel implements PatchNotesModelInterface {
	
	public static function patchNotesFileContent() {

		return nl2br(file_get_contents('../Build/patchnotes.txt'));

	}
}