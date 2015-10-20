/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * The open source SDBM project hash function.
     * 
     * <p>
     * This function seems to have a good over-all distribution for many different data sets.
     * It seems to work well in situations where there is a high variance in the MSBs of the elements in a data set.
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public function sdbm( bytes:ByteArray ):uint
    {
        var h:uint;
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            h = c + uint( h << 6 ) + uint( h << 16 ) - h;
        }
        
        return h;
    }
    
}