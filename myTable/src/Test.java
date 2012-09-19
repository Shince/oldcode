import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TreeMap map = new TreeMap();
		TreeMap map2 = new TreeMap();
		map2.put("bb", "bbbbbb");
		map2.put("cc", "cccccc");
		map.put("aa", map2);
		Set set = map.entrySet();
		
		System.out.println( set );
		
		System.out.println( set.iterator() );
		
		System.out.println( set.iterator().next() );
		
		System.out.println( map );
		
		System.out.println( set.iterator().next() instanceof Object );
		
		System.out.println( set.iterator().next() instanceof TreeMap );
		
		System.out.println( set.iterator().next() instanceof Entry );
		
		Entry e = (Entry)set.iterator().next();
		
		System.out.println( e.getKey() + "---->" + e.getValue() );
	}

}
