package project;

import java.io.IOException;
import java.util.TreeMap;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


public class q10 {
	
	public static class MapperEx extends Mapper<LongWritable, Text, Text, Text> {

		
		public void map(LongWritable key, Text value, Context c)throws IOException, InterruptedException {
			String Line = value.toString();
			String[] arr =Line.split("\t");
			String case_status = arr[1];
			String job_title = arr[4];
			
		
			c.write(new Text(job_title), new Text(case_status));
			
		}
		}
	
	public static class ReducerEx extends Reducer<Text,Text,NullWritable,Text>{
		private TreeMap<Double, String> job_success = new TreeMap<Double, String>();
		public void reduce(Text key, Iterable<Text> value, Context c){
			 double total =0;
			 double sum=0;
			 for (Text val:value)
			 {
				 String case_status = val.toString();
				 if(case_status.equals("CERTIFIED") || case_status.equals("CERTIFIED WITHDRAWN"))
				 {
					total++ ;//if above status is found increase total
				    sum++;//increment count of only cer and cer-wd status
				 }
				    else 
				    	total++;//if other cases are found increase total anyway
			 		}
			double per = (sum/total)*100;
			if(per >=70 && total >=1000){
				String op = key.toString();
				op = op + ',' + total+ ','+per;
			
			job_success.put(per, op);
			}
			
				 
		}
		protected void cleanup(Context c) throws IOException, InterruptedException{
			for(String val : job_success.descendingMap().values()){
				c.write(NullWritable.get(),new Text(val));
			}
				
		
		}
	}

	
	public static void main(String[] args) throws ClassNotFoundException, IOException, InterruptedException {
		Configuration conf =new Configuration();
		Job job=Job.getInstance(conf,"Jobs having success rate more than 70%");
		
		job.setJarByClass(q10.class);
		job.setMapperClass(MapperEx.class);
		job.setReducerClass(ReducerEx.class);
		
		job.setOutputKeyClass(NullWritable.class);
		job.setOutputValueClass(Text.class);
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(Text.class);
		
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job,new Path(args[1]));
	System.exit(job.waitForCompletion(true) ? 0 : 1);

	}

}

