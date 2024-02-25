extends Control

@export var container:TabContainer

func _ready() -> void:
	_build_tab("Godot", Engine.get_license_text())

	_build_tab("FreeType",
	"""Portions of this software are copyright © <year> The FreeType Project (www.freetype.org). All rights reserved.
	""" #NOTE:<year> should correspond to the value from the FreeType version used in your build. This information can be found in the editor by opening the Help > About dialog and going to the Third-party Licenses tab.
	); printerr("Set the year in the FreeType License")
	_build_tab("ENet",
	"""Copyright (c) 2002-2020 Lee Salzman

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	""")

	_build_tab("mbed TLS",
	"""Copyright The Mbed TLS Contributors

	Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
	""")

	_build_tab("vxpMono Font",
	"vxpMono Font: Copyright (c) voidxptr <CC-BY>"
	) # NOTE: Please Insert attribution to the used Font here.

func _build_tab(tab_name: String, license: String):
	var lable: Label = Label.new()

	lable.name = tab_name
	lable.text = license
	lable.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	container.add_child(lable)

func _build_tab_from_copyright_info(dic:Dictionary) -> void:
	var lable: Label = Label.new()
	lable.autowrap_mode = TextServer.AUTOWRAP_WORD

	lable.name = dic.get("name", "unknown")
	for part:Dictionary in dic.get("parts"):
		lable.text += "Files: " + str(part.get("files") as Array) + "\n"
		lable.text += "Copyright: " + str(part.get("copyright") as Array) + "\n"
		lable.text += "License: " + part.get("license") + "\n"
		lable.text += str(Engine.get_license_info().get(part.get("license")))

	container.add_child(lable)
