set-alias vi vim

function prompt {
  $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
  $principal = [Security.Principal.WindowsPrincipal] $identity
  $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

  $user = $(	if (Test-Path variable:/PSDebugContext) { 'DBG' }
    	          elseif($principal.IsInRole($adminRole)) { "ADMIN" }
    		 else { $env:username}
    	       ) 
  $computer = $env:computername
  $location = $(get-location)
  $symbol = $(	if (Test-Path variable:/PSDebugContext) { '$' }
    	elseif($principal.IsInRole($adminRole)) { "#" }
    	else { '$'}
    )
  write-host (' ' + $user + '@' + $computer +' ') -nonewline -foregroundcolor black -backgroundcolor yellow
  write-host (' ' + $location + ' ') -nonewline -foregroundcolor black -backgroundcolor magenta
  write-host (' ' + $symbol + ' ') -nonewline -foregroundcolor black -backgroundcolor cyan
return " "
}
