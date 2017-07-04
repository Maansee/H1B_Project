package project;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;



public class q7 {

	public static class MyMapper extends Mapper<LongWritable, Text, Text, Text>
	{
		public void map(LongWritable key, Text value, Context c) throws IOException, InterruptedException
		{
			String[] str = value.toString().split("\t");
			String year = str[7];
			String case_status = str[1];

		
			c.write(new Text(year), new Text(case_status));
		}
	}
	
	public static class MyReducer extends Reducer<Text, Text, Text, IntWritable>
	{
		
		
		public void reduce(Text key, Iterable<Text> values, Context c) throws IOException, InterruptedException
		{
			int count= 0;
			for(Text val: values)
			{
				count++;
			}
			c.write(key, new IntWritable(count));
		}
	}
	
	
	
	public static void main(String[] args) throws IOException, ClassNotFoundException, InterruptedException 
	{
	
		    Configuration conf = new Configuration();
		    
		    Job job = Job.getInstance(conf, "Total number of applications for each year");
		    job.setJarByClass(q7.class);
		    job.setMapperClass(MyMapper.class);
		    job.setReducerClass(MyReducer.class);
		    
		    job.setMapOutputKeyClass(Text.class);
		    job.setMapOutputValueClass(Text.class);
		    job.setOutputKeyClass(Text.class);
			job.setOutputValueClass(IntWritable.class);
		    FileInputFormat.addInputPath(job, new Path(args[0]));
		    FileOutputFormat.setOutputPath(job, new Path(args[1]));
		    System.exit(job.waitForCompletion(true) ? 0 : 1);
		
	}

}

