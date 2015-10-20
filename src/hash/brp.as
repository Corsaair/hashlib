/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Bruno R Preiss hash function.
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     * 
     * @see http://www.brpreiss.com/ Bruno R. Preiss website
     */
    public function brp( bytes:ByteArray ):uint
    {
        var hash:uint;
        
        var i:uint;
        var c:uint;
        var len:uint  = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = uint( hash << 7 )  ^ c;
        }
        
        return hash;
    }

}