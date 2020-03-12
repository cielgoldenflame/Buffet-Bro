#ease of variable
$psWindow = $host.UI.RawUI
#buffer first when expanding
$newSize =$psWindow.BufferSize
$newSize.Width = 144
$psWindow.BufferSize = $newSize
#windowsize first when shrinking
$newSize = $psWindow.WindowSize
$newSize.Width = 144
$newSize.height = 40
$psWindow.WindowSize= $newSize

$Global:qp = 0
$Global:hp = 20
$Global:slime = 10
$Global:string = $null
$Global:ua = $null
$global:coat = 'on'
$global:escape = $false

function Typeitfast {
    foreach ($ch in $Global:string.ToCharArray()){
        Write-Host "${ch}" -NoNewline
    }
    Write-Host "" 
}
#GAME Start
Clear-Host
#Title
$Global:string = '
                                                                          ``i+i.
                                                                          ,x@W@W*
                                                                         .MWi;ix@#
                                                                        .x@i,;i;#@ni:.
                                                                 ``.,,:*M#+:,:;i;*x@@@x*
                                                         `.     `ix@@@###n,,,:;iii;i+n@##
                                                       `;xz    `z@n;:izMn::,,::;iiii;iin@;
                                                      `+@@:   `#@+,:,,,,,,,:,::;iii;;i;izM
                                                     `+@WW`  `*@*,:,,,,,,,,,,::;iiiiii;iiM+
                                                     :@*#@+,,#@*,,,,,,,,,:,,:,,:iiiiii;ii*Wi
                                                     zM,:x#@@Wi:::,,,,,,,::,::,:iiiiiiii;i#@x,
                                                    `Mz,,:i+*:,,,:,:,,,,,,;x@W*:iiiiiiiiiii+@W,
                                                    `W#,,,,,:,,,,*xM#::,;z@###@ziiiiiii;iiii*@M.
                                                    `M#,,,,,,,,:zW**xW#z@@n++x@@+i;;;iiiiii;i##z
                                                     #n,,,,,,:,zW:``.;zz+,``.,iW@*;ii;*##+iii;x@;
                                                     ;W:,,,,,,+W:````````````..:MW**#M@@##M*;i*@M
                                                     ###,:,:,*@i`````````````.,,:xWx#i;:iM#M;i;n#i
                                                    .@@Wi:,:#@i.`````````````..,,.,,,,,,.:W#+ii*@x
                                                    ;#+;xxxWM;````````````````.,,..,,,..,,z#ziiiM@,   
                                                    i@:::Wx:.+:`````````````,n:,,,,..,,,,.###i;in#i 
                                                    i#;,#W,:n#;`````````````*W@i,,,......:WWiiii##+
                                                    ,@+;@+.i.````````````````.zW:.,.....;MW*;ii;###
                                                    `nxnW.````````````````````.zz.,...,i@Miiii;;###
                                                     ;@#*``````````````````````.+,,....,nW*iiiiiz#+
                                                     `MW.``````````````````````.,......ii+W*;ii;n#i
                                                     ,@#```,x;``````:.`````````........:M#iM*i;;M#:
                                                     #@,```n#x`````,x````.*nxz:.........:M#iMiii@@.
                                                    `MM````W#M`````##````*W###@;..,....;*:M*#n;*#W
                                                    ,##````W#n````:@,`````.;n@#n.,....,,Mx;M:Miz#z
                                                    *#;````#@;```.x#`````````;MM.,....,.,nx*z##W#i
              ;+zzi                                 z@,````.,````#@,``````````.i.,....,i+,x#n+W#@.
            ;M@WW@@+                               `xW.`````````*@*`````````````.,....,:nz:M*x##n
           *W#,..,xW`                              `WM`````````i@M.`````````````.......,,z+ixn##
          :W;`````*@.                              .@x`````````M#+``````````````.....,.+z,#,nM#M
          n*``````*@.                              .@x`````````##n``````````````.......:W+,,i##i
         .M.``````zW`                              .@x`````````,W#i`````````````.......,**,,W#M
         ;z```````Mn                               .@M``````````i@M.``````,`````...,..,,....*#@:
         +*``````.@i                               .@W```````````,.```````n+.``....,........,x#
         #*``````:@.                               `W@.``.*```````````````##n.`...,.........,*#x
         z*``````*n`                               `x#:`.xx.```````````.;#@##M:...,.........,*#x
         ##`````.##                                 z#*`*#@M#i:..`.,:*nWx+,:W#n.............,z#z
         ix````..+z                                 *#z`*#*.:*znnxxMx#;.   :W#n...........,,:@@:
         ,@,``...iW.                                :#W..WW+.   ````    `:nM+W*,.........,.:M#z
         `n+...,.,M+                                `W#i`iziMz;`      .*MW+.`x:,.......,;i#W#x.
          ;W:,.,.,;W*                                z#n``,`,#@Wn+**#x@W#,```+.,....,,.+###W+`
         .;##,,,.,.;W#                               ;#@:`````,+M@##Wx*.`````........,;@##:.
   `:#xMWW@#@ni,..,.:xM:                             `M#z```````.,::.````````........,W#n
  `z@@xn#+++zM@W+,.,,,x@i                             i#@;`````:xMWW,```````.....,.,,x#M.
  +#n,```````.:z@Wi,,,,M@;                            `x#M.`````;nMz.```````..,..,.,n#W,
 .@x.```````````,n#z.,.;@M`                            :@#z````````````````.....,,,n###`
 ,#*````````````.`+#*.,,z#xi                            i@#+``````````````......,,x#@zWWz:
 ,#*``````````````.Mx.,.:@##Wz;.                        `*@@+`````````````.,,...;W##n,,*x@xi
 `Wz```````````````z@,.,.x#####@x#;.                 .,:i+M##z.``````````.,..,,#@x+@i,,,,*#@M*.
  *@,`.,:i**i,.````z#:..,+##znMW@##@Wxz+ii;;i*+#znxMW@@@@@WW@#M:````````..,..,,;:,#M,.,.,*#zx@W+.
  `nMxW@#@@###W#,`.MW,..,i#@+;;i*+#zxMWW@@@@WWMMxnzz#+**ii;;xWM@z,`````.....,.,.,;@i.,..,n@#+#n@M*
   #@#i:,.,,;+n@@MM#+,...i#zn;;;;;;;;;iiiiiii;;;;;;;;;;;;;;i@#,in@z:``........,.iWz.....,@W++++#x@x:
  ,@+``````````.*M#n.....#W;M;;;;;;;;;;;;;i;;;;;;;;;;;;;;;;i@;,,.x##Wz+*ii:,,,,#@n,,...,*#n++++++#M@#.
  +#:````````````.+@*...,Mz,Wi;;;;;;;;;;;;;;;;;;;;;;;;;;;;;i@:...:W###@Mz*,,;#@##,,....,W@#++++++++n@W;
  n#;``````````````*@:,.i@:.M*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;i@i,.,,:M##Wn##zM@#Mi.,,..,.##x++++++++++#M@#
  ##*``````````````.W#,,MW,.n#*;;;;;;;;;;;;;;;;;;;;;;;;;;;;iWz,,,,.,+M@###@Wzi,,...,..i@W#++++++++++++n@M,
  ,WW.`.,,,,.```````Wz,*M@,,nz+*i;;;;;;;;;;;;;;;;;;;;;;;;;;;nW,,....,,,;i;:,.......,,;@@#++++++++++++++z@W;
   :MWxW@##@@Mn+:.`:@i,,+W,.n#+++i;;;;;;;;;;;;;;;;;;;;;;;;;;*@z.....,,,.,,,,,,...,..i@@z++++++++++++++++#W@i
    :@xi,:;i+nW@#WMWn,,,zx..x#++++*i;;;;;;;;;;;;;;;;;;;;;;;;;z@+,...........,...,,,#@@z++++++++++++++++++#M@*
   `nW.```````.,+M##*,.,x*.,M+++++++*i;;;;;;;;;;;;;;;;;;;;;;;in@:............,,,,;M#M#++++++++++++++++++++#M@*
   `Wn```````````.+#M,.:W:.iM+++++++++*i;;;;;;;;;;ii;;;;;;;;;;+@:.............,ix@@n++++++++++++++++++++++++x@*
   `MM````````````.W@,,+n,,nn++++++++++++*ii;;;;;i##;;;;;;;;;;zW,.......,,,;*zM@Wx#++++++++++++++++++++++++++x@i
    ##*```````````*#M,,W;,;W++++++++++++++++++***+@z;;;;;;;;;;Mx........,.z@@Wxz++++++++++++++++++++++++++++++x@;
    .W#x*:......:z@@i,nz,,Mz+++++++++++++++++++++z#z;;;;;;;;;i@#,........;@n#++++++++++++++++++++++++++++++++++MW:
     :W###@WWWWW@M#:,zx,,nn+++++++++++++++++++#zxW##;;;;;;;;;*@i........,+@++++++++++++++++++++++++++++++++++++#MW,
      :M#@+;;;;:,,,*MM,,zx+++++++++++++++++#nMWM#n#+;;;;;;;;;+#:........,zW+++++++++++++++++++++++++++++++++++++#Wx
       `*M@WMnzznM@@z,:nx#+++++++++++#znxW@@x+:``##+;;;;;;;;iz@,.........nM++++++++++++++++++++++++++++++++++++++#@#
         `:+zxMWW@#x++WWnzzzzzznnxxMW@@Wx#;.`    ##+;;;;;;;;;nM,........,Mx+++++++++++++++++++++++++++++++++++++++z@i
             ```.:i#nxWW@@@@@@@WWMnz+i,.`        z#*;;;;;;;;;Mn.........,@n++++++++++++++++++++++++++++++++++++++++nW,
                     ```.......````              z#*;;;;;;;;iWz.........:@z+++++++++++++##++++++++++++++++++++++++++xx
                                                 +#+;;;;;;;;i@+.........;#z+++++++++++++zMx#++++++++++++++++++++++++#W+
                                                 +#+;;;;;;;;i@i.........i@#++++++++++++++zMWMz+++++++++++++++++++++++n@:
                                                 +#+;;;;;;;;*#;.........*@+++++++++++++++znnM@Mz+++++++++++++++++++++zMM.
                                                 +#+;;;;;;;;+#:.........#@+++++++++++++++zzzznM@Wn#+++++++++++++++++#zn@+
                                                 *##;;;;;;;;+@,,......,,zW++++++++++++++#zzzzzzx##@Mz#++++++++++++++#zzWx
                                                 *##;;;;;;;;#@,,......,.nM++++++++++++++#zzzzzzx#ninWWxn#+++++++++++zzzMx
                                                 ;#z;;;;;;;;zW,.........xM++++++++++++++zzzzzzzW#*  .in@W#+++++++++#zzzW#
                                                 ;#z;;;;;;;;zW..........Mx++++++++++++++zzzzzzz@#:    .Wn+++++++++#zzzn@;
                                                 :#n;;;;;;;;nM.......,.,Wx+++++++++++++#zzzzzzn#@`   `nM++++++++++zzzzxW.
                                                 ,#x;;;;;;;;nM.,......,,Wn+++++++++++++#zzzzzzx#x    i@#+++++++++#zzzzWz
                                                 .@M;;;;;;;;nM.,....,.,,@n+++++++++++++zzzzzzzW#+   .Wn+++++++++#zzzzn@:
                                                 `WWi;;;;;;;nx.,....,.,,@n+++++++++++++zzzzzzz@#;   #W+++++++++#zzzzzMM
                                                 `M@i;;;;;;;nx.,....,.,,@n++++++++++++#zzzzzzn#@.  .@z++++++++#zzzzzn@+
                                                  x@i;;;;;;;nx.,....,..,@n++++++++++++#zzzzzzx#M`  zW++++++++#zzzzzzM@.
                                                  z#*;;;;;;;nM.,.......,@n++++++++++++#zzzzzzx#n  ,@z+++++++zzzzzzzn@z
                                                  +#+;i;;;;;nM.,.......,@n++++++++++++zzzzzzzM#+  zW++++++#zzzzzzzzx@:
                                                  i#W*i;;;;;nM.........,@n+++++++++++#zzzzzzzW#i ,@n+++++#zzzzzzzzn@n
                                                  ,#@@zi;;;;zW........,,@n+++++++++++#zzzzzzz@#: zW+++++zzzzzzzzzzM@:
                                                  .@n#@M+i;;zW,........,Wn+++++++++++#zzzzzzz@#.,@n+++#zzzzzzzzzzn@x
                                                  `Mx.;x@M+;#@,.........Wx+++++++++++zzzzzzzn@@`z@#++#zzzzzzzzzzzM@:
                                                   xW.,.iM@Mn@,.........Mx+++++++++++zzzznxM@#@,@x+#zzzzzzzzzzzzn@n
                                                   #@,.,.,ix@x........,.nM++++++++++#znxW@@Mn#@i#xzzzzzzzzzzzzzzW@:
                                                   *#:,.....,,,,........zW#+++++#znxM@@@x#;,:#@i#@nzzzzzzzzzzzzx#z
                                                   ;#i,...,,............i@@WWWW@@@@Wn#i,,,,,;##n##Wnzzzzzzzzzzn@W.
                                                   :#*..................,:+zzz#+i;,,........;###xx#MzzzzzzzzzzM#*
                                                   .@#,.................,,,,..,,,,,.........;##@;,M#Wnzzzzzzzn@x
                                                   `Wn..................,,,,,,..,,..........;##z.,,x#@xnnnnnnW@:
                                                   `xW.,....................................:##;.,,,z@#@@WW@@@i
                                                    z@,.....................................:@@,,....;#xW@###+
                                                    ##+,..................................,.,@@.,...,.,,,n###i
                                                    *##Mi,..............................,...,W@,......,,+@n*@M.
                                                    i#MW@x*,,,,,...................,.,,,.,inW##:.......,@#.,n#*
                                                    :#ni+x@Wzi,.............,,....,..,;+x@##@@#*,,...,.*M,.,i#x
                                                    .#M;;;i#M@Wx#i:,...........,:;+zx@##@WMxnx#z.....,.+M,;,,@@,
                                                    `@W;;;;;i#nM@#@WMxnzzzznnxW@@###@WMxnzzzzn@W,,.,.,.:@WW,.WW.
                                                    `M@i;;;;i+++#znMMWWW@@WWWWMxxnznnzzzzzzzzzW#;,.,.,,.;W@,:@z
                                                     x@*;;;;i+++++++++++++++++++++#zzzzzzzzzzzx#n,,.,,,,.::.z@:
                                                     z#+;;;;i+++++++++++++++++++++#zzzzzzzzzzzz@@+:......,.;@n
                                         ______            _______  _______  _______ _________   ______   _______  _______ 
                                        (  ___ \ |\     /|(  ____ \(  ____ \(  ____ \\__   __/  (  ___ \ (  ___  )(  ___  )
                                        | (   ) )| )   ( || (    \/| (    \/| (    \/   ) (     | (   ) )| (   ) || (   ) |
                                        | (__/ / | |   | || (__    | (__    | (__       | |     | (__/ / | (___) || |   | |
                                        |  __ (  | |   | ||  __)   |  __)   |  __)      | |     |  __ (  |     _/ | |   | |
                                        | (  \ \ | |   | || (      | (      | (         | |     | (  \ \ | (\ (   | |   | |
                                        | (___) )| (___) || )      | )      | (____/\   | |     | (___) )| ) \ \__| (___) |
                                        |______/ (_______)|/       |/       (_______/   )_(     |______/ |/   \__/(_______)
                                                                    
                                        
                                                                          Are You Hungry?
                                                                            (Y)es/(N)o'

Typeitfast
Write-Host ""
$Global:ua = Read-Host ':'
switch ($Global:ua) {
    'Y' {$Global:qp = 10}
    'N' {$Global:qp = 200;break}
}
#shrink for game
#window
$newSize = $psWindow.WindowSize
$newSize.Width = 75
$newSize.height = 25
$psWindow.WindowSize= $newSize
#buffer
$newSize =$psWindow.BufferSize
$newSize.Width = 75
$psWindow.BufferSize = $newSize
function Typeit {
    foreach ($ch in $Global:string.ToCharArray()){
        Write-Host "${ch}" -NoNewline
        Start-Sleep -Milliseconds 75
    }
    Write-Host "" 
}
function Typeitslow {
    foreach ($ch in $Global:string.ToCharArray()){
        Write-Host "${ch}" -NoNewline
        Start-Sleep -Seconds 1
    }
    Write-Host "" 
}
function SlimeEncounter {
    while ($Global:slime -gt 0 -and $Global:hp -gt 0) `
    {
        Clear-Host
        $Global:string = "A slime has spawned from your lunch!`nYour health is $Global:hp. The slime's health is $Global:slime.`nWhat will you do?`n(A)ttack`n(R)un"
        Typeit
        $Global:ua = $null
        $Global:ua = Read-Host ':'
        if($Global:ua -eq 'a') {
                Clear-Host
                $Global:string = "You engage the slime in fierce combat!"
                Typeit
                $Global:string = "....."
                Typeitslow
                $Global:slime = $Global:slime - (Get-Random -Minimum 0 -Maximum 5);
                $Global:hp = $Global:hp - (Get-Random -Minimum 0 -Maximum 5)
        }elseif ($Global:ua -eq 'r') {
            Get-Random -Minimum 0 -Maximum 9 | ForEach-Object `
            {
                Clear-Host
                if($_ -lt '4') `
                {
                    $Global:string = "You cannot escape!"
                    Typeit
                    Pause
                }else `
                {
                    $Global:string = "You got away safely!"
                    Typeit
                    Pause
                    $global:escape = $true
                    break
                }
            }
        }
        
    }
    if ($Global:hp -le 0) `
    {
        $Global:qp = 101
    }elseif ($Global:slime -le 0) `
    {
        $Global:qp = 100
    }elseif ($global:escape -eq $true) `
    {
        $Global:qp = 110
        } 
}

while ($Global:qp -lt 100) `
{
    if ($Global:qp -eq 10) `
    { #Start parklot sidewalk
        Clear-Host
        $Global:string = "You leave class headed to the buffet which way will you take? `n(L)eft: Through the Parking Lot `n(R)ight: Take the sidewalks"
        Typeit
        $Global:ua = $null
        $Global:ua = Read-Host ':'
        switch ($global:ua) {
             "l" {$Global:qp = 20}
             "r" {$Global:qp = 30}
         }
    }elseif ($Global:qp -eq 20) `
    { #parking lot avoids the road
        Clear-Host
        $Global:string = "As you manuver through the crowded parking lot, `nyou see many cars exiting and wonder where they would be going.`n(You're walking between cars)"
        Typeit
        $Global:string = ".........."
        Typeitslow
        $Global:qp = 50
    }elseif ($Global:qp -eq 30) `
    { #first time at the road
        Clear-Host
        $global:string = "A road intersects the sidewalk ahead;`ncars are streaming out, without regard to pedestrians. `nWill you risk crossing, or will you wait? `n(C)ross`n(W)ait"
        Typeit
        $Global:ua = $null
        $global:ua = Read-Host ":"
        switch ($global:ua) {
            'c' {Clear-Host
                Get-Random -Minimum 1 -Maximum 100 | ForEach-Object {
                    if ($_ -ge 75) {
                        $Global:qp = 40
                    }else {
                        $Global:qp = 35
                        $Global:hp = $Global:hp - (Get-Random -Minimum 0 -Maximum 5)
                    }
                }
            }
            'w' {Clear-Host
                $Global:string = "You patiently wait as cars pass infront of you."
                Typeit
                $Global:string = ".........."
                Typeitslow
                Clear-Host
                $Global:string = "The cars have all passed, you may cross now."
                Typeit
                Pause
                $Global:qp = 40
            }
        }
    }elseif ($Global:qp -eq 35) `
    { #Got hit once and the rest of the time
        if ($Global:hp -gt 0) {
            Clear-Host
            $Global:string = "You tried to cross and got knocked over by a car. Your health is now $Global:hp `nWill you risk crossing again, or will you wait?`n(C)ross`n(W)ait?"
            Typeit
            $Global:ua = $null
            $Global:ua = Read-Host ":"
            switch ($Global:ua) {
                'c' {Clear-Host
                    Get-Random -Minimum 1 -Maximum 100 | ForEach-Object {
                        if ($_ -ge 75) {
                            $Global:qp = 40
                        }else {
                            $Global:qp = 35
                            $Global:hp = $Global:hp - (Get-Random -Minimum 0 -Maximum 5)
                        }
                    }
                }
                'w' {Clear-Host
                    $Global:string = "You patiently wait as cars pass infront of you."
                    Typeit
                    $Global:string = ".........."
                    Typeitslow
                    Clear-Host
                    $Global:string = "The cars have all passed, you may cross now."
                    Typeit
                    Pause
                    $Global:qp = 40
                }
            }
        }else {$Global:qp = 101}       
    }elseif ($Global:qp -eq 40) `
    { #after Crossing the Street
        Clear-Host
        $Global:string = "You've made it across the street unscathed,`nand now you continue to the buffet."
        Typeit
        Pause
        $Global:qp = 50
    }elseif ($Global:qp -eq 50) `
    { #finally at the buffet
        Clear-Host
        $Global:string = "You've got to the buffet. Are you still hungry?`n(Y)es`n(N)o"
        Typeit
        $Global:ua = $null
        $Global:ua = Read-Host ":"
        switch ($Global:ua) {
            "Y" {$Global:qp = 60}
            "N" {
                Clear-Host
                $Global:string = "Why did you come all this way then?"
                Typeit
                $Global:string = "....."
                Typeitslow
                Clear-Host
                Write-Host ""
                $Global:string = 'Weirdo...'
                Typeitslow
                Write-Host ""
                Pause
                Clear-Host
                $Global:string = "You're coming in anyway."
                Typeit
                Write-Host ""
                Pause
                $global:qp = 60
            }
        }
    }elseif ($Global:qp -eq 60) `
    { #lobby first time
        Clear-Host
        $Global:string = "As you enter the buffet lobby you have two directions to go.`n(S)traight`n(R)ight"
        Typeit
        $Global:ua = $null
        $Global:ua = Read-Host ":"
        switch ($Global:ua) {
            "s" {$Global:qp = 70}
            "r" {$Global:qp = 65}
        }
    }elseif ($Global:qp -eq 65) `
    { #coat rack
        Clear-Host
        $Global:string = "After turning aroud the corner you see the coat rack.`n(I)nteract`nGo (B)ack"
        Typeit
        $Global:ua = $null
        $Global:ua = Read-Host ":"
        switch ($Global:ua) {
            "i" {
                Clear-Host
                $Global:string = "You take your coat off and hang it on the rack.`nYou then head back to the lobby"
                Typeit
                Pause
                $global:coat = 'off'
                $Global:qp = 67
            }
            "b" {$Global:qp = 67}
        }
    }elseif ($Global:qp -eq 67) `
    { #lobby second time
        Clear-Host
        $Global:string = "As you re-enter the lobby you have two directions to go.`n(S)traight`n(R)ight"
        Typeit
        $Global:ua = $null
        $Global:ua = Read-Host ":"
        switch ($Global:ua) {
            "s" {$Global:qp = 70}
            "r" {$Global:qp = 65}
        }
    }elseif ($Global:qp -eq 70) `
    { #Register
        Clear-Host
        $Global:string = "You approach the register and hand the cashier your payment."
        Typeit
        Pause
        Clear-Host
        switch ($global:coat) {
            'off' {
                $Global:string = "He takes your payment and allows you to go get your food."
                Typeit
                Pause
                $Global:qp = 80
            }
            'on'  {
                Get-Random -Minimum 1 -Maximum 100 | ForEach-Object {
                    if ($_ -gt 50) {
                        $Global:string = "He takes your payment and allows you to go get your food."
                        Typeit
                        Pause
                        $Global:qp = 80
                    }else {
                        $Global:string = "He throws your payment back in your face,`nand demands that you take your coat off before you get food."
                        Typeit
                        Pause
                        $Global:qp = 67
                    }
                }
            
            }
        }
    }elseif ($Global:qp -eq 80) `
    { #has food will eat
        Clear-Host
        $Global:string = "After you've gone through the line and found a spot to sit,`nyou begin eating your food when" 
        Typeit
        $Global:string = "..."
        Typeitslow
        $Global:string = "you notice it start to wiggle..."
        Typeit
        Pause
        $Global:qp = 90
    }elseif ($Global:qp -eq 90) `
    {#Boss Slime
        SlimeEncounter
    }
}
if ($Global:qp -eq 101){ #death
    Clear-Host
    $Global:string = "You have perished somewhere along your journey to the buffet.`nRestart (Y/N) "
    Typeit
    $Global:ua= Read-Host ":"
    switch ($Global:ua) {
        'n' {Clear-Host}
        'y' {.\main.ps1}
    }
}elseif ($Global:qp -eq 100) `
{ #WIN
    Clear-Host
    $Global:string = "You have defeated the slime.`nSince its a buffet, you get more food, eat,`nand leave to finish class."
    Typeit
    Pause
}elseif ($Global:qp -eq 110) `
{ #Ran Away
    Clear-Host
    $Global:string = "You made it out of the buffet safely,`nbut because you did not eat you die of hunger in class."
    Typeit
    Pause
}elseif ($Global:qp -eq 200) `
{ #did not play
    Clear-Host
    break
}
#shrink for end
#window
$newSize = $psWindow.WindowSize
$newSize.Width = 30
$newSize.height = 15
$psWindow.WindowSize= $newSize
#buffer
$newSize =$psWindow.BufferSize
$newSize.Width = 30
$psWindow.BufferSize = $newSize

Clear-Host
$Global:string = ' _______  _        ______  
(  ____ \( (    /|(  __  \ 
| (    \/|  \  ( || (  \  )
| (__    |   \ | || |   ) |
|  __)   | (\ \) || |   | |
| (      | | \   || |   ) |
| (____/\| )  \  || (__/  )
(_______/|/    )_)(______/ 

    Thanks For Playing
 Author Chris Lichner 2020'
Typeit
Pause
exit