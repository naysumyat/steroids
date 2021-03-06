on run argv

	if (count argv) = 0 then
		#log "No arguments given, opening any index.html"
		set StringPart to "index.html"
	else
		#log "Opening " & item 1 of argv
		set StringPart to item 1 of argv
	end if

	# Make sure Safari is running.
	# Note that we don't *activate* it yet, so that if something goes wrong the Terminal window stays active and the user gets to see error messages.
	# (This also avoids a bug affecting both OSX 10.8 and 10.9 where, if Safari isn't running, `tell application "Safari" to activate` *launches, but doesn't activate* Safari.)
	tell application "Safari" to launch

	tell application "System Events"

		tell process "Safari"

			# Try to obtain a reference to the `Developer > {iPhone|iPad} Simulator`submenu items; give up after a while.
			set simSubMenu to missing value
			repeat with i from 1 to 20
				# Note that we reference the Developer menu by *index*, as its name may be localized.
				# Furthermore, we search for the relevant menu item by the tokens "iPhone" or "iPad" only, since the "Simulator" part could be localized, too.
				# Note that the menu-item name reflects whether the simulator currently simulates the iPhone or the iPad.
				tell (first menu item of menu -3 of menu bar 1 whose name contains "iPhone" or name contains "iPad" or name contains "Simulator" )
					if exists then # Menu item found?
						# Simulate a click on the menu item so as to get it to populate its submenu with the currently debuggable pages.
						click it
						# Loop over submenu items and find the desired page.
						set pageUrl to missing value
						repeat with itm in menu items of menu of it
							set props to properties of itm # !! Bizarrely, this intermediate step is needed - directly accessing `help of itm` leads to strange behavior on OSX 10.8.
							set pageUrl to help of props # Page URL is in `help` property.
							if pageUrl is not missing value and pageUrl contains StringPart then
								# Only now that we've found a matching page do we activate Safari.
								tell application "Safari" to activate
								# Finally, click on the item to show the Web Inspector for the matching page.
								click itm
								return
							end if
						end repeat
						# Report error, if no matching page found.
						error "No currently debuggable page matching '" & StringPart & "' found."
					end if
				end tell
				delay 0.2 # Menu item not (yet) available; try again.
			end repeat

			# Getting here means that the simulator menu item wasn't found within the timeout period.
			# Abort with an error.
			error "Cannot determine debuggable pages: iOS Simulator-related menu items not found in Safari.
Make sure that the `Developer` menu is activated in the advanced preferences and that the iOS simulator is running a UIWebView-based app."


		end tell

	end tell

end run
