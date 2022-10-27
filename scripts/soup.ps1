function Get-Soup{
    <#
    .SYNOPSIS
        Give or deny a user the soup they are requestion.
    .DESCRIPTION
        A user asks for a soup type, a soup size, and a soup quantity (between 1 and 5). If I don't like how they asked for soup, I give them no soup!
    .EXAMPLE
        Get-Soup Tomato Cup 1
    .EXAMPLE
        Get-Soup Chowder Bowl 2
    .EXAMPLE
        Get-Soup Minestrone Pot 4 -Please

    #>
    [Alias('Soup')]
    param(
        [Parameter(Mandatory=$true)]
        $soup,
        [Parameter(Mandatory=$true)]
        [ValidateSet('Cup','Bowl','Pot')]
        $size,
        [ValidateRange(1,5)]
        $Quantity = 1,
        [switch]$Please
    )
    if ($please) {
        "$Quantity $size$(if($quantity -gt 1){'s'}) of $soup soup for you."
    }else {
        "No $soup soup for you!"
    }
}